<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Response;
use Illuminate\Http\Request;
use App\Models\CategoriesModel;
use App\Models\NewsModel;
use App\Models\BaseModel;
use App\Models\ExcelModel;

class NewsController extends Controller
{
    private $route;
    private $login;

    function __construct()
    {
        if (in_array('__construct', get_class_methods(get_parent_class($this)))) {
            parent::__construct();
        }
        $this->route = 'news';
        $this->categories_model = new CategoriesModel();
        $this->model = new NewsModel();
        $this->excel_model = new ExcelModel();
        $this->base_model = new BaseModel();
        $_SESSION["title"] = 'Tin tức';
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
        $login = Session::get('login');
        $data = array();
        $getCategories = $this->categories_model->getCategories();
        $permission = $this->base_model->getPermission($login, $this->route);
        $csrfHash = csrf_token();
        $controller = $this->route;
        return view('Admin.news.view', compact(
            'getCategories',
            'csrfHash',
            'controller',
            'permission'
        ));
    }

    function getList(Request $request)
    {
        $numrows = 20;
        $page = $request->page;
        $search = json_decode($request->search, true);
        $count = $this->model->getTotal($search);
        $datas = $this->model->getList($search, $page, $numrows);
        $start = empty($page) ? 1 : (($page - 1) * $numrows + 1);
        $page_view = $this->base_model->paging($count, $numrows, NULL, $page);
        $permission = $this->base_model->getPermission($this->login, $this->route);
        $result = array();
        $result['paging'] = $page_view;
        $result['cPage'] = $page;
        $result['viewtotal'] = $count;
        $getCategories = $this->categories_model->getCategories();
        $result['csrfHash'] = csrf_token();
        $routes = $this->route;
        $result['content'] = view('Admin.news.list', compact(
            'datas',
            'start',
            'permission',
            'routes',
            'getCategories'
        ))->render();
        return json_encode($result);
    }

    function mysave(Request $request)
    {
        $permissions = $this->checkPermission('add');
        if ($permissions instanceof RedirectResponse) {
            return $permissions;
        }
        $id = $request->id;
        $fdata = $request->fdata;
        @rename(public_path() . "/assets/images/blog/tmp/" . $fdata['news_image'], public_path() . "/assets/images/blog/" . $fdata['news_image']);
        @rename(public_path() . "/assets/images/blog/tmp/" . $fdata['news_image_right'], public_path() . "/assets/images/blog/" . $fdata['news_image_right']);
        $result = $this->model->mysave($id, $fdata);
        return $result;
    }

    function getEdit($id)
    {
        $permissions = $this->checkPermission('edit');
        if ($permissions instanceof RedirectResponse) {
            return $permissions;
        }
        $login = Session::get('login');
        $permission = $this->base_model->getPermission($login, $this->route);
        $getNewsCategories = $this->categories_model->getCategories();
        $detail = $this->model->getItemDetail($id);
        return view('Admin.news.from', compact(
            'permission',
            'routes',
            'login',
            'controller',
            'getNewsCategories',
            'detail'
        ));
    }

    function ispopular(Request $request)
    {
        $permissions = $this->checkPermission('edit');
        if ($permissions instanceof RedirectResponse) {
            return $permissions;
        }
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);

        if ($validator->fails()) {
            return 'fail';
        }
        $id = $request->id;
        $status = $request->status;
        $this->model->change_is_popular($id, $status);
        return "success";
    }

    function isshow(Request $request)
    {
        $permissions = $this->checkPermission('edit');
        if ($permissions instanceof RedirectResponse) {
            return $permissions;
        }
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);

        if ($validator->fails()) {
            return 'fail';
        }
        $id = $request->id;
        $status = $request->status;
        $this->model->change_is_show($id, $status);
        return "success";
    }

    function setposition(Request $request)
    {
        $permissions = $this->checkPermission('edit');
        if ($permissions instanceof RedirectResponse) {
            return $permissions;
        }
        $validator = Validator::make($request->all(), [
            'position' => 'required',
        ]);

        if ($validator->fails()) {
            return 'fail';
        }
        $position = $request->position;
        $arr = json_decode($position);
        $this->model->setposition($arr);
        return "success";
    }

    function uploadFile(Request $request)
    {
        $permissions = $this->checkPermission('edit');
        if ($permissions instanceof RedirectResponse) {
            return $permissions;
        }
        if ($request->file('file')) {
            $file = $request->file('file');
            $filename = $file->getClientOriginalName();

            // File extension
            $extension = $file->getClientOriginalExtension();

            // File upload location
            $location = 'assets/images/blog/tmp/';

            // Upload file
            $file->move($location, $filename);
            $rs["status"] = "pass";
            $rs["filename"] = $filename;
            return json_encode($rs);
        } else {
            $rs["status"] = "fail";
            $rs["filename"] = '';
            return json_encode($rs);
        }
    }

    function delete(Request $request)
    {
        $permissions = $this->checkPermission('delete');
        if ($permissions instanceof RedirectResponse) {
            return $permissions;
        }
        $login = Session::get('login');
        $permission = $this->base_model->getPermission($login, $this->route);
        if (!isset($permission['delete'])) {
            $result['status'] = 0;
            return json_encode($result);
            exit;
        }
        $validator = Validator::make($request->all(), [
            'list' => 'required',
        ]);

        if ($validator->fails()) {
            $result['status'] = 0;
            return json_encode($result);
            exit;
        }
        $idList = $request->list;
        $this->model->mydelete($idList);
        $result['status'] = 1;
        return json_encode($result);
    }

    function exportexcel()
    {
        $search = $_GET['search'];
        $search = json_decode($search, true);
        $query = $this->model->getList($search, 0, 0);
        $objPHPExcel = new \PHPExcel();
        $objPHPExcel->createSheet(); // tạo 1 sheet mới
        $sheetIndex = $objPHPExcel->setActiveSheetIndex(0);
        $sheetIndex->setTitle("List News");
        $sheetIndex->SetCellValue('A1', getLanguage('all', 'stt'));
        $sheetIndex->SetCellValue('B1', getLanguage('all', 'title'));
        $sheetIndex->SetCellValue('C1', getLanguage('all', 'author'));
        $sheetIndex->SetCellValue('D1', getLanguage('all', 'view-number'));
        $sheetIndex->SetCellValue('E1', getLanguage('all', 'date'));
        $sheetIndex->SetCellValue('F1', getLanguage('all', 'popular'));
        $sheetIndex->SetCellValue('G1', getLanguage('all', 'show'));
        $i = 1;
        $row = 2;
        foreach (range('A', 'G') as $columnID) {
            $sheetIndex->getColumnDimension($columnID)->setAutoSize(true);
        }
        $objPHPExcel->getActiveSheet()->getStyle("A1:G1")->getFont()->setBold(true);
        foreach ($query as $item) {
            $popular = ($item->popular == 1) ? 'Checked' : 'unChecked';
            $show = ($item->isshow == 1) ? 'Show' : 'Hide';
            $sheetIndex->setCellValueByColumnAndRow(0, $row, (string)$i);
            $sheetIndex->setCellValueByColumnAndRow(1, $row, isset($item->news_title) ? $item->news_title : '');
            $sheetIndex->setCellValueByColumnAndRow(2, $row, isset($item->author) ? $item->author : '');
            $sheetIndex->setCellValueByColumnAndRow(3, $row, isset($item->views_number) ? $item->views_number : '');
            $sheetIndex->setCellValueByColumnAndRow(4, $row, date("d M Y", strtotime($item->date_created)));
            $sheetIndex->setCellValueByColumnAndRow(5, $row, $popular);
            $sheetIndex->setCellValueByColumnAndRow(6, $row, $show);
            $i++;
            $row++;
        }
        $versionExcel = 'Excel2007';
        $today = date('Y_m_d');
        $fileName = "List_news_" . $today . ".xlsx";
        $boderthin = "A1:G" . ($i);
        $this->excel_model->exportExcel($objPHPExcel, $versionExcel, $fileName);
    }
}
