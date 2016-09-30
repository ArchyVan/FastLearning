<?php
/**
 * Created by PhpStorm.
 * User: ios
 * Date: 2016/9/29
 * Time: 下午2:57
 */

namespace app\controllers;

use Yii;
use app\models\Post;
use yii\base\Action;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

class PostController extends Controller
{
    public function actionView($id)
    {
        $model = Post::findOne($id);
        if ($model === null) {
            throw new NotFoundHttpException;
        }
        return $this->render('view',['model' => $model]);
    }

    public function actionCreate()
    {
        $model = new Post;
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view','id' => $model->id]);
        } else {
            return $this->render('create',['model' => $model]);
        }
    }
}

class HelloWorldAction extends Action
{
    public function run()
    {
        return "Hello World";
    }
}