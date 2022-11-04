<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Response;
use Illuminate\Http\Request;
use App\Models\SecurityModel;
use App\Models\BaseModel;
use Illuminate\Support\Facades\Session;

class DashboardController extends Controller
{
    private $route;
    private $login;

    function __construct()
    {
        if (in_array('__construct', get_class_methods(get_parent_class($this)))) {
            parent::__construct();
        }
        $this->route = 'home';
        $menu = Session::get('menus');
        $this->title = isset($menu[$this->route]) ? $menu[$this->route] : $this->route;
        $this->security_model = new SecurityModel();
        $this->base_model = new BaseModel();
    }

    public function checkPermission($action = 'view')
    {
        $class = get_class($this);
        $login = Session::get('login');

        if (empty($login->username)) { //Chưa đăng nhập
            return redirect('/admin');
        } else if (!isset($login->params[$this->route]->$action)) {
            return redirect('/admin');
        }
    }

    public function view()
    {
        $permissions = $this->checkPermission();
        if ($permissions instanceof RedirectResponse) {
            return $permissions;
        }
        $_SESSION["title"] = 'Dashboard';
        $csrfHash = csrf_token();
        $routes = $this->route;
        $infoChart = $this->qtyChart();
        return view('Admin.home.view', compact('infoChart', 'routes', 'csrfHash'));
    }

    public function qtyChart()
    {
        $sql_news = "
            SELECT count(id) as total
            FROM ecommerce_news
            WHERE isdelete = 0
        ";
        $query_news = DB::select($sql_news);
        $total_news = !empty($query_news[0]->total) ? $query_news[0]->total : 0;

        $sql_products = "
            SELECT count(id) as total
            FROM ecommerce_product
            WHERE isdelete = 0
        ";
        $query_products = DB::select($sql_products);
        $total_products = !empty($query_products[0]->total) ? $query_products[0]->total : 0;

        $sql_contact = "
            SELECT count(id) as total
            FROM ecommerce_contact
            WHERE isdelete = 0
        ";
        $query_contact = DB::select($sql_contact);
        $total_contact = !empty($query_contact[0]->total) ? $query_contact[0]->total : 0;
        $arrRender = [];
        $arrRender['total_news'] = $total_news;
        $arrRender['total_products'] = $total_products;
        $arrRender['total_contact'] = $total_contact;
        return $arrRender;
    }

    public function setLanguage(Request $request)
    {
        if (isset($request->lang)) {
            $lang = $request->lang;
        } else {
            $lang = 'vn';
        }
        $langs = $this->security_model->getLanguage($lang);
        Session::put('keylang', $lang);
        Session::put('language', $langs);
        Session::put('lang', $lang);
        return 1;
    }

    function getNotify()
    {
        $arrRender = [];
        $arrRender['notify_order'] = '';
        $arrRender['total_notify_order'] = 0;
        $arrRender['notify_comment'] = 0;
        $arrRender['list_notify_comment'] = '';
        $arrRender['notify_reviews'] = '';
        $arrRender['list_notify_review'] = '';
        $arrRender['notify_contact'] = '';
        $arrRender['list_notify_contact'] = '';
        $arrRender['notify_events'] = '';
        $arrRender['list_notify_events'] = '';

        $sql = "
            SELECT
                c.code_order, a.ngay_dat_hang, a.id as id_notify, a.vat, c.qty, c.price, c.discount,
                CONCAT(b.name, ' ', b.last_name) AS fullname,  e.google_name as fullname_google
            FROM ecommerce_product_order a
            LEFT JOIN ecommerce_product_detail_order c ON a.id = c.id_order
            LEFT JOIN ecommerce_public_users b ON a.id_user = b.id
            LEFT JOIN ecommerce_google_users e ON e.google_id = a.id_user
            LEFT JOIN ecommerce_product d ON d.code = c.id_product
            WHERE a.isdelete = 0
                AND a.tinh_trang = 1
                AND a.is_notify = 1
            GROUP BY a.ngay_dat_hang
            ORDER BY a.ngay_dat_hang DESC
        ";
        $query = DB::select($sql);
        $html = "";
        $total_price_order = $this->base_model->getTotalPrice();
        if (!empty($query)) {
            foreach ($query as $key => $value) {
                // <i class="zmdi zmdi-edit text-info"></i>
                // <i class="zmdi zmdi-delete text-danger"></i>
                // <i class="zmdi zmdi-account text-success"></i>
                // <i class="zmdi zmdi-flag text-warning"></i>
                $full_name = !empty($value->fullname) ? $value->fullname : $value->fullname_google;
                $total = isset($total_price_order[$value->code_order]) ? $total_price_order[$value->code_order]->price : 0;
                $html .= '<li>';
                $html .= '<i class="zmdi zmdi-balance-wallet text-success"></i>';
                $html .= '<a href="javascript:void(0)" title="Close"><i class="zmdi zmdi-close closeNotify" id_order="' . trim($value->id_notify) . '" style="float: right;position: relative; color: grey;"></i></a>';
                $html .= '<strong>' . $full_name . ' +' . $total . ' VNĐ </strong>';
                $html .= '<p><strong>Order#:</strong> ' . $value->code_order . '</p>';
                $html .= '<small class="text-muted">' . $this->base_model->time_elapsed_string($value->ngay_dat_hang) . '</small>';
                $html .= '</li>';
            }
        }
        $getTotalStatusComment = $this->base_model->getTotalStatusComment();
        $getWarningContact = $this->base_model->getNotifyContact();
        $getWarningEvents = $this->base_model->getNotifyEvents();
        $getNotifyOrder = $this->base_model->getNotifyOrder();
        $getNotifyReviews = $this->base_model->getNotifyReviews();
        $arrRender = [];
        $arrRender['notify_order'] = !empty($getNotifyOrder['html']) ? $getNotifyOrder['html'] : '';
        $arrRender['total_notify_order'] = !empty($getNotifyOrder['total']) ? $getNotifyOrder['total'] : 0;
        $arrRender['notify_comment'] = !empty($getTotalStatusComment['pending_notify']) ? $getTotalStatusComment['pending_notify'] : 0;
        $arrRender['list_notify_comment'] = $getTotalStatusComment['html'];
        $arrRender['notify_reviews'] = $getNotifyReviews['total'];
        $arrRender['list_notify_review'] = $getNotifyReviews['list_review'];
        $arrRender['notify_contact'] = $getWarningContact['total_notify_contact'];
        $arrRender['list_notify_contact'] = $getWarningContact['list_notify_contact'];
        $arrRender['notify_events'] = $getWarningEvents['total_notify_events'];
        $arrRender['list_notify_events'] = $getWarningEvents['list_notify_events'];
        echo json_encode($arrRender);
        die;
    }

    function turnOffNotify(Request $request)
    {
        $action = $request->action;
        if ($action == 'close-order') {
            $id = $this->input->post('id');
            $sql_update = "
                UPDATE ecommerce_product_order
                SET is_notify = 0
                WHERE is_notify = 1
                    AND id = $id
            ";
            DB::update($sql_update);
        } else if ($action == 'close-comment') {
            $id = $request->id;
            $sql_update = "
                UPDATE ecommerce_comments
                SET is_notify = 0
                WHERE is_notify = 1
                    AND id = $id
            ";
            DB::update($sql_update);
        } else if ($action == 'close-review') {
            $id = $request->id;
            $sql_update = "
                UPDATE ecommerce_review_product
                SET is_notify = 0
                WHERE is_notify = 1
                    AND id = $id
            ";
            DB::update($sql_update);
        } else if ($action == 'mark-unread-orders') {
            $sql_update = "
                UPDATE ecommerce_product_order
                SET is_notify = 0
                WHERE is_notify = 1
            ";
            DB::update($sql_update);

            $sql_update2 = "
                UPDATE ecommerce_comments
                SET is_notify = 0
                WHERE is_notify = 1
            ";
            DB::update($sql_update2);

            $sql_update3 = "
                UPDATE ecommerce_review_product
                SET is_notify = 0
                WHERE is_notify = 1
            ";
            DB::update($sql_update3);
        } else if ($action == 'mark-unread-contact') {
            $sql_update1 = "
                UPDATE ecommerce_contact
                SET is_notify = 0
                WHERE is_notify = 1
            ";
            DB::update($sql_update1);
        } else if ($action == 'mark-unread-events') {
            $sql_update = "
                UPDATE ecommerce_events
                SET is_notify = 0
                WHERE is_notify = 1
            ";
            DB::update($sql_update);
        } else if ($action == 'turnoff-notify-contact') {
            $id = $request->id;
            $sql_update = "
                UPDATE ecommerce_contact
                SET is_notify = 0
                WHERE is_notify = 1
                    AND id = $id
            ";
            DB::update($sql_update);
        }
        echo 1;
        die;
    }
}
