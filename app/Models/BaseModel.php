<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class BaseModel extends Model
{
   function getPermission($login, $route) {
        $right = '';
        if (isset($login->params[$route])) {
            $right = json_encode($login->params[$route]);
        }
        return json_decode($right, true);
    }

    function paging($count, $rows = 1, $links = 5, $page = 1) {
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
            $from = (($page - 1) * $rows ) + 1;
        }
        if ($to > $count) {
            $to = $count;
        }

        $html = '<div class="col-sm-12 col-md-5">
            <div class="dataTables_info_custom" role="status">
                Showing '.$from.' to '.$to.' of '.$count.' entries
            </div>
        </div>';
        $html .= '<div class="col-sm-12 col-md-7">
            <div class="dataTables_paginate paging_simple_numbers" style="float: right;">
            <ul class="pagination">';
        $disabled_Previous = 'disabled';
        if ($page > 1) {
            $disabled_Previous= '';
        }
        $html .= '<li class="paginate_button page-item previous '.$disabled_Previous.'">
                <a href="javascript:void(0);" onclick="getDataPage(' . ($page - 1) . ');" class="page-link">Previous</a>
            </li>';
        for ($i = $startPage; $i <= $endPage; $i++) {
            $active = '';
            if ($i == $page) {
                $active = 'active';
            }
            $html .= '<li class="paginate_button page-item '.$active.'">';
            $html .= '<a href="javascript:void(0);" onclick="getDataPage(' . ($i) . ');" class="page-link">'. ($i) .'</a>';
            $html .= '</li>';
        }
        $disabled_Next = 'disabled';
        if ($page < $totalPage) {
            $disabled_Next = '';
        }
        $html .= '
        <li class="paginate_button page-item next '.$disabled_Next.'">
            <a href="javascript:void(0);" onclick="getDataPage(' . ($page + 1) . ');" class="page-link">Next</a>
        </li>';
        $html.='
            </ul>
            </div>
        </div>';
        return $html;
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
                case 'gnumeric':
                    /** Gnumeric */
                    $objReader = \PHPExcel_IOFactory::createReaderForFile($filename);
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
        } catch (Exception $e) {
            die('Error loading file: ' . $e->getMessage());
        }
    }
}