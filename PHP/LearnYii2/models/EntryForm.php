<?php
/**
 * Created by PhpStorm.
 * User: ios
 * Date: 16/9/6
 * Time: 下午3:05
 */
namespace app\models;

use Yii;
use yii\base\Model;

class EntryForm extends Model
{
    public $name;
    public $email;

    public function rules()
    {
        return [
          [['name','email'],'required'],
            ['email','email'],
        ];
    }
}