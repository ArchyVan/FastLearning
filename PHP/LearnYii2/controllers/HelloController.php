<?php
/**
 * Created by PhpStorm.
 * User: ios
 * Date: 2016/9/30
 * Time: 下午8:33
 */

namespace app\controllers;
use yii\web\Controller;
use Yii;

class HelloController extends Controller
{
    public $layout = 'common';

    public function actionIndex(){
//        $request = Yii::$app->request;
//        if ($request->isGet){
//        }
//        $rep = Yii::$app->response;
//        $rep->statusCode = 404;
//        $rep->redirect('https://www.baidu.com',302);
//        $rep->sendFile()
//        $session = Yii::$app->session;
//        $session->open();
//        if ($session->isActive){
//            echo 'Session is Active';
//        }
//        $session->set('user','ZhangSan');
//        $session->get('user');
//        $session->remove('user');
//         unset($session['user']);
//        $cookies = Yii::$app->response->cookies;
//        $cookie_data = array('name'=>'user','value'=>'zhangsan');
//        $cookies->add(new Cookie($cookie_data));
//        echo $cookies->get('user',20);
        return $this->render('say',['message' => 'Archy']);
    }
}