<?php
/**
 * Created by PhpStorm.
 * User: ios
 * Date: 16/9/7
 * Time: 上午9:56
 */
namespace app\controllers;

use yii\rest\ActiveController;

class RestController extends ActiveController
{
    public $modelClass = 'app\models\Country';
}