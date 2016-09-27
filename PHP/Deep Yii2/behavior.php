<? php
	class MyClass extends yii\base\Component
	{
				
	}

	class MyBehavior extends yii\base\Behavior
	{
		public $property1 = 'This is property in MyBehavior.';

		public function method()
		{
			return 'Method in MyBehavior is called.';
		}		
	}

	$myClass = new MyClass();
	$myBehavior = new MyBehavior();

	$myClass->attachBehavior('myBehavior', $myBehavior);

	echo $myClass->property1;
	echo $myClass->method1();

	class Behavior extends Object
	{
		public $owner;

		public function events()
		{
			return [];
		}

		public function attach()
		{
			... ...
		}

		public function detach()
		{
			... ...
		}
	}