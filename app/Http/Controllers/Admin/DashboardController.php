<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Response;
use Illuminate\Http\Request;
use App\Models\SecurityModel;
use App\Models\BaseModel;

class DashboardController extends Controller
{
    private $route;
    private $login;
    private $title;

    function __construct()
    {
        $this->security_model = new SecurityModel();
        $this->base_model = new BaseModel();
        $this->route = 'home';
        $_SESSION["title"] = 'Home';
    }

    public function checkPermission($action = 'view')
    {
        $login = Session::get('login');
        if (!isset($login->params[$this->route]->$action)) {
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
        $infoChart = $this->qtyChart();
        return view('Admin.home.view', compact(
            'infoChart',
            'csrfHash'
        ));
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
        $getTotalStatusComment = $this->base_model->getTotalStatusComment();
        $getWarningContact = $this->base_model->getNotifyContact();
        $getWarningEvents = $this->base_model->getNotifyEvents();
        $getNotifyOrder = $this->base_model->getNotifyOrder();
        $getNotifyReviews = $this->base_model->getNotifyReviews();

        $notify_order = !empty($getNotifyOrder['html']) ? $getNotifyOrder['html'] : '';
        $list_notify_comment = $getTotalStatusComment['html'];
        $list_notify_review = $getNotifyReviews['list_review'];
        $list_notify_contact = $getWarningContact['list_notify_contact'];
        $list_notify_events = $getWarningEvents['list_notify_events'];
        $arrRender = [];
        $arrRender['total_notify_order'] = !empty($getNotifyOrder['total']) ? $getNotifyOrder['total'] : 0;
        $arrRender['notify_comment'] = !empty($getTotalStatusComment['pending_notify']) ? $getTotalStatusComment['pending_notify'] : 0;
        $arrRender['notify_reviews'] = $getNotifyReviews['total'];
        $arrRender['notify_contact'] = $getWarningContact['total_notify_contact'];
        $arrRender['notify_events'] = $getWarningEvents['total_notify_events'];
        $arrRender['list_notify'] = $notify_order . $list_notify_comment . $list_notify_review . $list_notify_contact . $list_notify_events . $list_notify_events;
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
