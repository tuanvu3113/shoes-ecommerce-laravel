<div class="card-header">
    <h6><strong><?= getLanguage('all', 'tim-thay') ?> <span class='viewtotal'>0</span> <?= getLanguage('all', 'ket-qua') ?>
        </strong> </h6>
</div>
<div class="card-body table-responsive" style="max-height:500px;">
    <div class="row">
        <table id="listData" class="table table-hover table-striped">
            <thead>
                <tr>
                    <th class="text-center" width="40">
                        <input type="checkbox" name="keys[]" id="checkall">
                        <label for="checkall"></label>
                    </th>
                    <th><?= getLanguage('all', 'stt') ?></th>
                    <th><?= getLanguage('all', 'title') ?></th>
                    <th style="text-transform: capitalize;"><?= getLanguage('all', 'author') ?></th>
                    <th style="text-transform: capitalize;"><?= getLanguage('public', 'categories') ?></th>
                    <th style="text-transform: capitalize;"><?= getLanguage('all', 'view-number') ?></th>
                    <th style="text-transform: capitalize;"><?= getLanguage('all', 'date') ?></th>
                    <th style="text-transform: capitalize;"><?= getLanguage('all', 'popular') ?></th>
                    <th style="text-transform: capitalize;"><?= getLanguage('all', 'show') ?></th>
                    <th><?= getLanguage('all', 'images') ?></th>
                    <th><?= getLanguage('all', 'image-popular') ?></th>
                </tr>
            </thead>
            <tbody>
                <?php
                $i = $start;
                foreach ($datas as $item) { 
                    $arr_ct = isset($item->categories) ? explode(",", $item->categories) : array();
                    $list_ct = "";
                    if (!empty($arr_ct)) {
                        foreach ($arr_ct as $key => $value) {
                            $ct = isset($getCategories[$value]) ? $getCategories[$value] : '';
                            $list_ct .= $ct.',';
                        }
                    }
                    $list_ct = trim($list_ct, ",");
                    ?>
                    <tr class="row_content edit" id="<?= $item->id; ?>">
                        <td style="text-align: center;">
                            <input class="chkrow" name="check" type="checkbox" id="<?= $item->id; ?>">
                            <label for="<?= $item->id; ?>"></label>
                        </td>
                        <td class="center"><?= $i; ?></td>
                        <td class="title"><a href="<?php echo admin_url() . $routes . "/edit/" . $item->id; ?>"><?= $item->news_title_vn; ?></a></td>
                        <td class="author"><?= $item->author; ?></td>
                        <td class=""><?= $list_ct; ?></td>
                        <td class="views_number"><?= $item->views_number; ?></td>
                        <td class="date_created"><?= date("d M Y", strtotime($item->date_created)) ?></td>
                        <td class="popular text-center">
                            <input type="checkbox" class="ispopular" id="ispopular<?= $item->id; ?>" name="<?= $item->id; ?>" <?php echo ($item->popular == 1) ? "checked" : ""; ?>>
                            <label for="ispopular<?= $item->id; ?>"></label>
                        </td>
                        <td class="isshpw text-center">
                            <input type="checkbox" class="isshow" id="isshow<?= $item->id; ?>" name="<?= $item->id; ?>" <?php echo ($item->isshow == 1) ? "checked" : ""; ?>>
                            <label for="isshow<?= $item->id; ?>"></label>
                        </td>
                        <td class="image"></td>
                        <td class="image_right"></td>
                    </tr>
                <?php
                    $i++;
                }
                ?>
            </tbody>
        </table>
    </div>
</div>