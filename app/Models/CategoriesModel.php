<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class CategoriesModel extends Model
{
    public function getCategories()
    {
        $rs_categories = [];
        $rs_categories_tmp = DB::table('ecommerce_news_categories')
            ->select('*')
            ->where('isdelete', 0)
            ->get();
        if (!empty($rs_categories_tmp[0])) {
            foreach ($rs_categories_tmp as $key => $value) {
                $rs_categories[$value->id] = $value->name;
            }
        }
        return $rs_categories;
    }
}
