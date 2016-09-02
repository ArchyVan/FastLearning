<?php
	namespace app\controllers;

	use yii\rest\ActiveController;

	/**
	* Display UserController
	*/
	class UserController extends ActiveController
	{
		public $modelClass = 'app\models\NewUser';		
	}
