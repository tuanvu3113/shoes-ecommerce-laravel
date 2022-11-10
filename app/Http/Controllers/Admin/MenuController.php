<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;


class MenuController extends Controller
{
    public function getMenu()
    {
        $login = Session::get('login');
        if (empty($login)) {
            return '';
        }
        $groupid = isset($login->groupid) ? $login->groupid : '';
        $group = DB::table('ecommerce_groups')
            ->select('id', 'params as permission')
            ->where('isdelete', 0)
            ->where('id', $groupid)
            ->get();
        $permission = json_decode($group[0]->permission, true);
        $right = "";
        if (count($permission) == 0) {
            return "";
        }
        foreach ($permission as $key => $val) {
            $right .= "," . $key;
        }
        $right = substr($right, 1);
        $lang = Session::get("language");
        $parent_menu = DB::table('ecommerce_menus')
            ->select('name as menuName', 'keylang', 'ordering', 'classicon', 'route as controller', 'id as pageid')
            ->where('parent', 0)
            ->where('isdelete', 0)
            ->orderByRaw('ordering ASC')
            ->get();
        $menu = '';
        $i = 1;
        foreach ($parent_menu as $item) {
            $arrasub = (new MenuController)->getChildren($item->pageid, $right, $lang);
            $asub = $arrasub['menu'];
            $count_children = $arrasub['count_children'];
            $menuName = $item->menuName;
            if (isset($lang['menu'][trim($item->keylang)])) {
                $menuName = $lang['menu'][trim($item->keylang)];
            }
            if ($asub) {
                if (isset($lang['menu'][trim($item->keylang)])) {
                    $menuName = $lang['menu'][trim($item->keylang)];
                }
                $menu .= '
                    <li>
                        <a href="javascript: void(0);" class="has-arrow">
                            <i class="' . $item->classicon . '"></i>
                            <span>' . $menuName . '</span>
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            ' . $asub . '
                        </ul>
                    </li>
                ';
            } else {
                if (in_array($item->pageid, explode(',', $right))) {
                    $menu .= '
                        <li>
                            <a href="' . ($item->controller) . '">
                                <i class="' . $item->classicon . '"></i>
                                <span data-key="' . $item->classicon . '">' . $menuName . '</span>
                            </a>
                        </li>
                    ';
                }
            }
            $i++;
        }
        return $menu;
    }

    public function getChildren($id, $right, $lang)
    {
        $children = DB::select(
            '
            SELECT gm.name AS menuName, gm.keylang, gm.ordering,
            gm.route AS controller, gm.classicon, gm.id AS pageid
            FROM ecommerce_menus gm
            WHERE gm.parent = ' . $id . '
                AND gm.isdelete = 0
                AND (
                    gm.id IN (' . $right . ') OR
                    gm.id IN (SELECT mm.parent FROM ecommerce_menus mm WHERE mm.route IN (' . $right . '))
                )
            ORDER BY gm.ordering ASC'
        );
        // echo'<pre>';print_r($children);die;
        // $results = DB::select('select * from users where id = :id', ['id' => 1]);
        $count_children = count($children);
        $menu = '';
        foreach ($children as $item) {
            $arrasub = (new MenuController)->getChildren($item->pageid, $right, $lang);
            $asub = $arrasub['menu'];
            if (isset($lang['menu'][trim($item->keylang)])) {
                $menuName = $lang['menu'][trim($item->keylang)];
            } else {
                $menuName = $item->menuName;
            }
            if ($asub) {
                $menu .= '
                    <li>
                        <a href="javascript: void(0);" class="has-arrow">
                            <i class="' . $item->classicon . '"></i>
                            <span>' . $menuName . '</span>
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            ' . $asub . '
                        </ul>
                    </li>
                ';
            } else {
                $menu .= '
                    <li>
                        <a href="' . ($item->controller) . '">
                            <i class="mdi mdi-record" style="font-size: 13px !important;"></i>
                            <span data-key="">' . $menuName . '</span>
                        </a>
                    </li>
                ';
            }
        }
        $arrRender['menu'] = $menu;
        $arrRender['count_children'] = $count_children;
        return $arrRender;
    }
}
