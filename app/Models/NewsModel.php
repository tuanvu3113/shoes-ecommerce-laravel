<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class NewsModel extends Model
{
    function object_item_table()
    {
        $obj = new \stdClass();
        $obj->id = "";
        $obj->news_title = "";
        $obj->news_title_vn = "";
        $obj->link = "";
        $obj->isshow = "";
        $obj->news_image = "";
        $obj->picture_mobile = "";
        $obj->json_pictures = "";
        $obj->news_content = "";
        $obj->news_content_vn = "";
        $obj->author = "";
        $obj->news_summary = "";
        $obj->news_summary_vn = "";
        $obj->popular = "";
        $obj->tag = "";
        $obj->position = "100";
        $obj->is_publish = 0;
        $obj->user_create = "";
        $obj->time_create = "";
        $obj->user_update = "";
        $obj->time_update = "";
        $obj->isdelete = 0;
        return $obj;
    }

   function getSearch($search)
    {
        $sql = "";
        if (!empty($search['title'])) {
            $sql .= " AND news_title LIKE '%" . addslashes(trim($search['title'])) .
                "%' OR news_title_vn LIKE '%" . addslashes(trim($search['title'])) . "%'";
        }
        if (!empty($search['categories'])) {
            $dem4 = 1;
            $arr_categories = explode(",", $search['categories']);
            foreach ($arr_categories as $key => $categories) {
                if (empty($categories)) {
                    continue;
                }
                if ($dem4 == 1) {
                    $or_and4 = ' AND (';
                } else {
                    $or_and4 = ' OR ';
                }
                $sql .= $or_and4 . "FIND_IN_SET('" . $categories . "', categories)";
                $dem4++;
            }
            $sql .= ")";
        }
        return $sql;
    }

    function getList($search, $page, $numrows)
    {
        $sql = "
            SELECT *
            FROM ecommerce_news
            WHERE isdelete = 0
        ";
        $sql .= $this->getSearch($search);
        $sql .= " ORDER BY date_created DESC, date_update ASC";
        if ($numrows > 0) {
            $sql .= ' LIMIT ' . (($page - 1) * $numrows) . ',' . $numrows;
        }
        $query = \DB::select($sql);
        return $query;
    }

    function getTotal($search)
    {
        $sql = "
            SELECT COUNT(1) AS total
            FROM ecommerce_news
            WHERE isdelete = 0
        ";
        $sql .= $this->getSearch($search);
        $query = \DB::select($sql);
        if (empty($query[0]->total)) {
            return 0;
        } else {
            return $query[0]->total;
        }
    }

    public function getItemDetail($id)
    {
        if (empty($id)) {
            $obj = $this->object_item_table();
        } else {
            $sql = "
                SELECT id, news_title, news_content, news_image, date_created, author, isshow, popular, views_number,
                news_image_right, news_summary, news_summary_vn, news_content_vn, news_title_vn, link, keyword,categories,tag
                FROM ecommerce_news
                WHERE id='" . $id . "' AND isdelete = 0
            ";
            $rs = \DB::select($sql);
            if (count($rs) > 0) {
                $obj = $rs[0];
            } else {
                $obj = $this->object_item_table();
            }
        }
        return $obj;
    }

    function mysave($id, $data)
    {
        $rs = array("status" => true);
        try {
            $data['news_title'] = trim($data['news_title']);
            $data['news_title_vn'] = trim($data['news_title_vn']);
            $data['link'] = trim($data['link']);
            $data['link'] = trim($data['link'], '-');
            if (empty($id)) {
                $check = DB::table('ecommerce_news')
                ->select('*')
                ->where('news_title', $data['news_title'])
                ->get();
                if (!empty($rs_categories_tmp[0])) {
                    $rs["status"] = "exist";
                    return json_encode($rs);
                }
                $data['date_created'] = gmdate("Y-m-d H:i:s ", time() + 7 * 3600);
                DB::table('ecommerce_news')->insert($data);
            } else {
                unset($data['date_created']);
                $data['date_update'] = gmdate("Y-m-d H:i:s ", time() + 7 * 3600);
                DB::table('ecommerce_news')
                ->where('id', $id)
                ->update($data);
            }
            $rs["status"] = "success";
        } catch (Exception $e) {
            $rs["status"] = "fail";
        }
        return json_encode($rs);
    }

    public function mydelete($idList)
    {
        $sql = "UPDATE ecommerce_news SET isdelete=1 WHERE id IN (" . $idList . ") AND id > 0 AND isdelete = 0";
        DB::update($sql);
    }

    function change_is_show($id, $status)
    {
        DB::update('UPDATE ecommerce_news SET isshow = ? WHERE id = ?',[$status,$id]);
    }

    function change_is_popular($id, $status)
    {
        DB::update('UPDATE ecommerce_news SET popular = ? WHERE id = ?',[$status,$id]);
    }

    function setposition($arr)
    {
        foreach ($arr as $item) {
            DB::update('UPDATE ecommerce_news SET position = ? WHERE id = ?',[$item->position,$item->id]);
        }
    }
}