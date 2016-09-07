<?php
/**
 * Created by PhpStorm.
 * User: ios
 * Date: 16/9/6
 * Time: 下午3:11
 */
use yii\helpers\Html;
?>
<p>You have entered the following information:</p>

<ul>
    <li><label>Name</label>: <?= Html::encode($model->name) ?></li>
    <li><label>Email</label>: <?= Html::encode($model->email) ?></li>
</ul>