<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class BaseModel extends Model
{
    function getPermission($login, $route)
    {
        $right = '';
        if (isset($login->params[$route])) {
            $right = json_encode($login->params[$route]);
        }
        return json_decode($right, true);
    }

    function getTotalPrice($id = "")
    {
        $where = "";
        if (!empty($id)) {
            $where = " AND a.id_user =" . $id;
        }
        $sql = "
            SELECT
                c.code_order,
                c.id_product,
                c.discount,
                c.price,
                c.qty
            FROM
                ecommerce_product_order a
                    LEFT JOIN
                ecommerce_product_detail_order c ON a.id = c.id_order
            WHERE
                a.isdelete = 0 $where
        ";
        $rs = DB::select($sql);
        $arr_datas = [];
        $arr_datas2 = [];
        foreach ($rs as $item) {
            $arr_datas[$item->code_order][] = $item;
        }
        foreach ($arr_datas as $code => $value) {
            foreach ($value as $v) {
                if (isset($arr_datas2[$code])) {
                    $arr_datas2[$code]->qty += $v->qty;
                    $discount = isset($v->discount) ? $v->discount : 0;
                    $price = ($v->price * ((100 - $discount) / 100)) * $v->qty;
                    $arr_datas2[$code]->price += $price;
                } else {
                    $arr_datas2[$code] = $v;
                    $discount = isset($v->discount) ? $v->discount : 0;
                    $price = ($v->price * ((100 - $discount) / 100)) * $v->qty;
                    $arr_datas2[$code]->price = $price;
                }
            }
        }
        return $arr_datas2;
    }

    public function getTotalStatusComment()
    {
        $arr_total = [];
        $arr_total['pending'] = 0;
        $arr_total['pending_notify'] = 0;
        $arr_total['approve'] = 0;
        $arr_total['trash'] = 0;
        $arr_total['html'] = 0;
        $sql = "
            SELECT m.id,m.page_id,m.parent_id,m.content,m.submit_date, CONCAT(u.name, ' ', u.last_name) AS fullname,
            n.news_title, m.is_approve, m.isdelete, m.is_notify
            FROM ecommerce_comments m
            LEFT JOIN ecommerce_public_users u ON m.name = u.username
            LEFT JOIN ecommerce_news n ON m.page_id = n.id
            WHERE u.isdelete = 0
                AND n.isdelete = 0
            ORDER BY m.submit_date DESC
        ";
        $query = DB::select($sql);
        $html = "";
        foreach ($query as $item) {
            if ($item->isdelete == 1) {
                $arr_total['trash'] += 1;
            }
            if ($item->is_approve == 0) {
                $arr_total['pending'] += 1;
            }
            if ($item->is_approve == 1) {
                $arr_total['approve'] += 1;
            }
            if ($item->is_approve == 0 && $item->is_notify == 1) {
                $arr_total['pending_notify'] += 1;
                $html .= '<li>';
                $html .= '<i class="zmdi zmdi-comments text-success"></i>';
                $html .= '<a href="javascript:void(0)" title="Close"><i class="zmdi zmdi-close closeNotify" id_comment="' . trim($item->id) . '" style="float: right;position: relative; color: grey;"></i></a>';
                $html .= '<a href="/admin.php/comments?id_comments=' . trim($item->id) . '" title="View comment"><strong>Username: ' . $item->fullname . ' </strong></a>';
                $html .= '<p><strong>Title: </strong> <a target="_blank" href="/news/' . $item->page_id . '.html">' . $this->cutContent($item->news_title, 30) . '</a></p>';
                $html .= '<p><strong>Comment: </strong>' . $this->cutContent($item->content, 30) . '</p>';
                $html .= '<small class="text-muted">' . $this->time_elapsed_string($item->submit_date) . '</small>';
                $html .= '</li>';
            }
        }
        $arr_total['html'] = $html;
        foreach ($arr_total as $key => $value) {
            if ($value > 100) {
                $arr_total[$key] = '99+';
            }
        }
        return $arr_total;
    }

    public function getNotifyReviews()
    {
        $total = 0;
        $arr_render['total'] = 0;
        $arr_render['list_review'] = "";
        $sql = "
            SELECT a.*, b.name
            FROM ecommerce_review_product a
            LEFT JOIN ecommerce_product b ON a.id_product = b.code
            WHERE a.isdelete = 0
                AND b.isdelete = 0
                AND a.is_notify = 1
        ";
        $query = DB::select($sql);
        $html = "";
        if (!empty($query[0])) {
            foreach ($query as $value) {
                $html .= '<li>';
                $html .= '<i class="zmdi zmdi-comment-text-alt text-success"></i>';
                $html .= '<a href="javascript:void(0)" title="Close"><i class="zmdi zmdi-close closeNotify" id_review="' . trim($value->id) . '" style="float: right;position: relative; color: grey;"></i></a>';
                $html .= '<a href="/admin.php/reviews?id_review=' . trim($value->id) . '" title="View review"><strong> Username: ' . $value->username . '</strong></a>';
                $html .= '<p><strong>Title:</strong> <a target="_blank" href="/product/' . $value->id_product . '">' . $this->cutContent($value->name, 30) . '</a></p>';
                $html .= '<p><strong>Start:</strong> ' . $value->rating . '</p>';
                $html .= '<p><strong>Review:</strong> ' . $this->cutContent($value->content_review, 30) . '</p>';
                $html .= '<small class="text-muted">' . $this->time_elapsed_string($value->datecreate) . '</small>';
                $html .= '</li>';
                $total++;
            }
        }
        $arr_render['total'] = $total;
        $arr_render['list_review'] = $html;
        return $arr_render;
    }

    public function getNotifyEvents()
    {
        $arrRender = [];
        $arrRender['list_notify_events'] = "";
        $arrRender['total_notify_events'] = 0;
        $sql = "
            SELECT *
            FROM ecommerce_events
            WHERE isdelete = 0
                AND is_notify = 1
            ORDER BY start_date DESC
        ";
        $query = DB::select($sql);
        $total = 0;
        $html = "";
        if (!empty($query)) {
            $arr = [];
            foreach ($query as $key => $value) {
                // So sanh ngay
                $time_now = date_create(gmdate('Y-m-d', time() + 7 * 3600));
                $start_date = date_create(date("Y-m-d", strtotime($value->start_date)));
                $diff_date_tmp = date_diff($time_now, $start_date);
                $diff_date = $diff_date_tmp->days;
                $class_info = "b-info";
                $arr[] = $diff_date;
                if ($diff_date == 0  || $diff_date == 1) {
                    $class_info = "b-info";
                } else if ($diff_date >= 5 && $diff_date <= 10) {
                    $class_info = "b-primary";
                } else if ($diff_date < 10) {
                    $class_info = "b-warning";
                } else {
                    $class_info = "b-warning";
                }
                $html .= '<div class="sl-item ' . $class_info . '">';
                $html .= '<div class="sl-content">';
                $html .= '<div class="text-muted">' . $this->time_elapsed_string($value->start_date) . '</div>';
                $html .= '<p>' . $value->title . '<br><small class="text-muted">' . date("d M Y H:i:s", strtotime($value->start_date)) . '</small></p>';
                $html .= '</div>';
                $html .= '</div>';
                $total++;
            }
            // print_r($arr);die;
        }
        $arrRender['list_notify_events'] = $html;
        $arrRender['total_notify_events'] = $total;
        return $arrRender;
    }

    public function getNotifyContact()
    {
        $arrRender = [];
        $arrRender['list_notify_contact'] = "";
        $arrRender['total_notify_contact'] = 0;
        $sql = "
            SELECT *
            FROM ecommerce_contact
            WHERE isdelete = 0
                AND is_notify = 1
            ORDER BY datecreated DESC
        ";
        $query = DB::select($sql);
        $total = 0;
        $html = "";
        if (!empty($query)) {
            foreach ($query as $key => $value) {
                $html .= '<li>';
                $html .= '<i class="zmdi zmdi-account text-info"></i>';
                $html .= '<a href="javascript:void(0)" title="Close"><i class="zmdi zmdi-close closeNotifyContact" id_contact="' . trim($value->id) . '" style="float: right;position: relative; color: grey;"></i></a>';
                $html .= '<a href="javascript:void(0)" title="Reply"><i class="zmdi zmdi-mail-reply replyContact" id_contact="' . trim($value->id) . '" style="float: right;position: relative; top:50px; left: 10px;"></i></a>';
                $html .= '<a href="/admin.php/contact?id_contact=' . trim($value->id) . '" title="View contact"><strong> Username: ' . $value->fullname . '</strong> </a>';
                $html .= '<p><strong>Content:</strong> ' . $this->cutContent($value->content, 30) . '</p>';
                $html .= '<small class="text-muted">' . $this->time_elapsed_string($value->datecreated) . '</small>';
                $html .= '</li>';
                $total++;
            }
        }
        $arrRender['list_notify_contact'] = $html;
        $arrRender['total_notify_contact'] = $total;
        return $arrRender;
    }

    function getNotifyOrder()
    {
        $arrRender = [];
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
        $total_price_order = $this->getTotalPrice();
        $stt = 0;
        if (!empty($query)) {
            foreach ($query as $key => $value) {
                if ($stt > 5) {
                    continue;
                }
                // <i class="zmdi zmdi-edit text-info"></i>
                // <i class="zmdi zmdi-delete text-danger"></i>
                // <i class="zmdi zmdi-account text-success"></i>
                // <i class="zmdi zmdi-flag text-warning"></i>
                $full_name = !empty($value->fullname) ? $value->fullname : $value->fullname_google;
                $total = isset($total_price_order[$value->code_order]) ? $total_price_order[$value->code_order]->price : 0;
                $html .= '<li>';
                $html .= '<i class="zmdi zmdi-balance-wallet text-success"></i>';
                $html .= '<a href="javascript:void(0)" title="Close"><i class="zmdi zmdi-close closeNotify" id_order="' . trim($value->id_notify) . '" style="float: right;position: relative; color: grey;"></i></a>';
                $html .= '<a href="/admin.php/orders?id_orders=' . trim($value->code_order) . '" title="View orders"><strong>' . $full_name . ' +' . $total . ' VNĐ </strong></a>';
                $html .= '<p><strong>Order#:</strong> ' . $value->code_order . '</p>';
                $html .= '<small class="text-muted">' . $this->time_elapsed_string($value->ngay_dat_hang) . '</small>';
                $html .= '</li>';
                $stt++;
            }
        }
        // if ($stt > 5) {
        //     $html.= '<div class="border-top">
        //     <a title="View all" class="btn btn-sm btn-link btn-block text-center" href="/admin.php/orders">
        //     <i class="zmdi zmdi-arrow-right" style="margin-right: 0.25rem!important;"></i> View all </a>
        //     </div>';
        // }
        $arrRender['total'] = $stt;
        $arrRender['html'] = $html;
        return $arrRender;
    }

    function time_elapsed_string($datetime)
    {
        $currentDateTime = new \DateTime(gmdate("Y-m-d H:i:s ", time() + 7 * 3600));
        $passedDateTime = new \DateTime($datetime);
        $interval = $currentDateTime->diff($passedDateTime);
        $day = $interval->format('%a');
        $hour = $interval->format('%h');
        $min = $interval->format('%i');
        $seconds = $interval->format('%s');
        if ($day > 7) {
            // $dateArray = date_parse_from_format('Y/m/d', $datetime);
            // $monthName = DateTime::createFromFormat('!m', $dateArray['month'])->format('F');
            // $date_end = $dateArray['day'] . " " . $monthName  . " " . $dateArray['year'];
            $date_end = date("d M Y H:i:s ", strtotime($datetime));
        } else if ($day >= 1 && $day <= 7) {
            $date_end = $day . " days ago";
        } else if ($hour >= 1 && $hour <= 24) {
            $date_end = $hour . " hours ago";
        } else if ($min >= 1 && $min <= 60) {
            $date_end = $min . " minutes ago";
        } else if ($seconds >= 1 && $seconds <= 60) {
            $date_end = $seconds . " seconds ago";
        } else {
            $date_end = 'now';
        }
        return $date_end;
    }

    function paging($count, $rows = 1, $links = 5, $page = 1)
    {
        if ($rows == NULL)
            $rows = 2;
        if ($links == NULL)
            $links = 5;
        $tmp = (int) ($links / 2);
        $totalPage = (int) ($count / $rows);
        if (($totalPage * $rows) < $count)
            $totalPage = $totalPage + 1;

        if ($page <= ($tmp + 1))
            $startPage = 1;
        else
            $startPage = $page - $tmp;

        if ($totalPage - $page <= $tmp)
            $endPage = $totalPage;
        else
            $endPage = $page + $tmp;

        // var_dump($endPage-$startPage+1< $links);

        if ($endPage - $startPage + 1 < $links)
            $endPage = $links + $startPage - 1;
        if ($endPage > $totalPage) {
            $startPage = $startPage + $totalPage - $endPage;
            $endPage = $totalPage;
            if ($startPage <= 1)
                $startPage = 1;
        };

        $from = 0;
        $to = $page * $rows;
        if ($count > 0) {
            $from = (($page - 1) * $rows) + 1;
        }
        if ($to > $count) {
            $to = $count;
        }

        $html = '<div class="col-sm-12 col-md-5">
            <div class="dataTables_info_custom" role="status">
                Showing ' . $from . ' to ' . $to . ' of ' . $count . ' entries
            </div>
        </div>';
        $html .= '<div class="col-sm-12 col-md-7">
            <div class="dataTables_paginate paging_simple_numbers" style="float: right;">
            <ul class="pagination">';
        $disabled_Previous = 'disabled';
        if ($page > 1) {
            $disabled_Previous = '';
        }
        $html .= '<li class="paginate_button page-item previous ' . $disabled_Previous . '">
                <a href="javascript:void(0);" onclick="getDataPage(' . ($page - 1) . ');" class="page-link">Previous</a>
            </li>';
        for ($i = $startPage; $i <= $endPage; $i++) {
            $active = '';
            if ($i == $page) {
                $active = 'active';
            }
            $html .= '<li class="paginate_button page-item ' . $active . '">';
            $html .= '<a href="javascript:void(0);" onclick="getDataPage(' . ($i) . ');" class="page-link">' . ($i) . '</a>';
            $html .= '</li>';
        }
        $disabled_Next = 'disabled';
        if ($page < $totalPage) {
            $disabled_Next = '';
        }
        $html .= '
        <li class="paginate_button page-item next ' . $disabled_Next . '">
            <a href="javascript:void(0);" onclick="getDataPage(' . ($page + 1) . ');" class="page-link">Next</a>
        </li>';
        $html .= '
            </ul>
            </div>
        </div>';
        return $html;
    }

    function cutContent($content, $limit)
    {
        $content = strip_tags($content);
        if (strlen($content) <= $limit) {
            return $content;
        } else {
            if (strpos($content, " ", $limit) > $limit) {
                $new_limit = strpos($content, " ", $limit);
                $new_content = substr($content, 0, $new_limit) . " ...";
                return $new_content;
            }
            $new_content = substr($content, 0, $limit);
            return $new_content;
        }
    }

    public function loadFile($filename)
    {
        $pathinfo = pathinfo($filename);
        if (isset($pathinfo['extension'])) {
            switch (strtolower($pathinfo['extension'])) {
                case 'xlsx':
                    /** Excel 2007 */
                    $objReader = new \PHPExcel_Reader_Excel2007();
                    $objReader->setReadDataOnly(false);
                    $objPHPExcel = $objReader->load($filename);
                    break;
                case 'xls':
                    /** Excel 5 */
                    $objReader = new \PHPExcel_Reader_Excel5();
                    $objReader->setReadDataOnly(true);
                    $objPHPExcel = $objReader->load($filename);
                    break;
                case 'ods':
                    /** Excel Open Office */
                    $objReader = new \PHPExcel_Reader_OOCalc();
                    $objReader->setReadDataOnly(true);
                    $objPHPExcel = $objReader->load($filename);
                    break;
                case 'slk':
                    /** SYLK */
                    $objReader = new \PHPExcel_Reader_SYLK();
                    $objReader->setReadDataOnly(true);
                    $objPHPExcel = $objReader->load($filename);
                    break;
                case 'xml':
                    /** XML */
                    $objReader = new \PHPExcel_Reader_Excel2003XML();
                    $objReader->setReadDataOnly(true);
                    $objPHPExcel = $objReader->load($filename);
                    break;
                case 'csv':
                    /** CSV File */
                    $objReader = new \PHPExcel_Reader_CSV();
                    $objPHPExcel = $objReader->load($filename);
                    break;
                default:
                    /** Sai dinh dang file*/
                    $objPHPExcel = "Wrong in file Extension";
                    break;
            }
        }
        return $objPHPExcel;
    }

    public function getDataFromFile($objPHPExcel, $arrayTitle, $sheetIndex, $rowstart, $function)
    {
        $index = $sheetIndex;
        $val = NULL;
        try {
            $worksheetIndex = 0;
            $count_tmp1 = count($arrayTitle);
            foreach ($objPHPExcel->getWorksheetIterator() as $worksheet) {
                if ($worksheetIndex == $index) {
                    $worksheetTitle = $worksheet->getTitle();
                    $highestRow = 10000; //$worksheet->getHighestRow();
                    $highestColumn = $worksheet->getHighestColumn(); // e.g 'F'
                    //$highestColumnIndex = \PHPExcel_Cell::columnIndexFromString($highestColumn);
                    $check = 0;
                    /**
                     * Check Content
                     * */
                    $row = $rowstart;
                    while ($row <= $highestRow) {
                        for ($col = 0; $col < $count_tmp1; ++$col) {
                            $cell = $worksheet->getCellByColumnAndRow($col, $row);
                            $val[$row][$col] = $cell->getValue(); // lay gia tri cua cell
                            if ($check == 0 && ($val[$row][$col] == '')) {
                                $val = NULL;
                                $val['error'] = "Sheet " . $worksheetIndex . " empty";
                                return $val;
                            } else if ($check == 0 && ($val[$row][$col] != $arrayTitle[$col])) {
                                $title_val = $val[$row][$col];
                                $title = $arrayTitle[$col];
                                $val = NULL;
                                $val['error'] = "Header is wrong at row =  " . $row . " col = " . $col . ". Right title must be '" . $title . "'. Title in file is '" . $title_val . "'";
                                return $val;
                            }
                        }
                        $check++;
                        $row++;
                    }
                    /**
                     * End Check Content
                     * */
                    /**
                     * Return Array Data
                     * */
                    $val = NULL;
                    for ($row = $rowstart + 1; $row <= $highestRow; $row++) {

                        for ($col = 0; $col < $count_tmp1; $col++) {
                            $cell = $worksheet->getCellByColumnAndRow($col, $row);
                            if ($function == "request") {
                                if (\PHPExcel_Shared_Date::isDateTime($cell)) {
                                    $val[$row - $rowstart - 1][$col] = date('Y-m-d', \PHPExcel_Shared_Date::ExcelToPHP($cell->getValue()));
                                } else {
                                    $val[$row - $rowstart - 1][$col] = $cell->getValue();
                                }
                            } else {
                                $val[$row - $rowstart - 1][$col] = $cell->getValue();
                            }
                        }
                    }
                    break;
                }
                $worksheetIndex++;
            }
            return $val;
        } catch (\Exception $e) {
            die('Error loading file: ' . $e->getMessage());
        }
    }
}
