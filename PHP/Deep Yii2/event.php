<?php 
	/**
	* 
	*/
	class Event extends Object
	{
		public $name;
		public $sender;
		public $handled = false;
		public $data;

		private static $_events = [];

		public function on($name,$handler,$data = null,$append = true)
		{
			$this->ensureBehaviors();
			if ($append || empty($this->_events[$name])) {
				$this->_events[$name][] = [$handler, $data];
			} else {
				array_unshift($this->_events[$name], )
			}
		}

		public function off($name,$handler)
		{
			$this->ensureBehaviors();
			if (empty($this->_events[$name])) {
				return false;
			}

			if ($handler === null) {
				unset($this->_events[$name]);
				return true;
			} else {
				$removed = false;

				foreach ($this->_events[$name] as $i => $event) {
					if ($event[0] === $handler) {
						unset($this->_events[$name][$i]);
						$removed = true;
					}
				}

				if ($removed) {
					$this->_events[$name] = array_values($this->_events[$name]);
				}
				return $removed;
			}
		}

		public function trigger($name, Event $event = null)
		{
			$this->ensureBehaviors();
			if (!empty($this->_events[$name]) {
				if ($event === null) {
					$event = new Event;
				}
				if ($event->sender === null) {
					$event->sender = $this;
				}
				$event->handled = false;
				$event->name = $name;

				foreach ($this->_events[$name] as $handler) {
					$event->data = $handler[1];

					call_user_func($handler[0],$event);

					if ($event->handled) {
						return;
					}
				}
			}

			Event::trigger($this,$name,$event);
		}

		// public static function on($class,$name,$handler,$data = null,$append = true)
		// {	
			
		// }

		// public static function off($class,$name,$handler = null)
		// {

		// }

		// public static function hasHandlers($class,$name)
		// {

		// }

		// public static function trigger($class,$name,$event = null)
		// {

		// }
	}

	$person = new Person;

	$person->on(Person::EVENT_GREET,'person_say_hello');

	$person->on(Person::EVENT_GREET,[$obj, 'say_hello']);

	$person->on(Person::EVENT_GREET,['app\helper\Greet','say_hello']);

	$person->on(Person::EVENT_GREET, function ($event)
	{
		echo "Hello";
	});

	$person->on(Person::EVENT_GREET,'person_say_hello','Hello World!');

	function person_say_hello($event) {
		echo $event->data;
	}

	abstract class Application extends Module
	{
		const EVENT_BEFORE_REQUEST = 'beforeRequest';
		const EVENT_AFTER_REQUEST = 'afterRequest';

		public function run()
		{
			try {

			    $this->state = self::STATE_BEFORE_REQUEST;

			    // 先触发EVENT_BEFORE_REQUEST
			    $this->trigger(self::EVENT_BEFORE_REQUEST);

			    $this->state = self::STATE_HANDLING_REQUEST;

			    // 处理Request
			    $response = $this->handleRequest($this->getRequest());

			    $this->state = self::STATE_AFTER_REQUEST;

			    // 处理完毕后触发EVENT_AFTER_REQUEST
			    $this->trigger(self::EVENT_AFTER_REQUEST);

			    $this->state = self::STATE_SENDING_RESPONSE;
			    $response->send();

			    $this->state = self::STATE_END;

			    return $response->exitStatus;

			} catch (ExitException $e) {

			    $this->end($e->statusCode, isset($response) ? $response : null);
			    return $e->statusCode;
			}		
    	}
	}

	$coal->on(Coal::EVENT_DISASTER,[$government, 'onDisaster']);

	class Government extends yii\base\Component
	{
		public function onDisaster($event)
		{
			echo 'DISASTER! from ' . $event->sender;
		}		
	}

	$coal->on(Coal::EVENT_DISASTER,[$baddy, 'onDisaster'],null,false);

	class Baddy extends yii\base\Component
	{
		public function onDisaster($event)
		{
			$event->handled = true;
		}		
	}

	// 删除所有EVENT_DISASTER事件的handler
	$coal->off(Coal::EVENT_DISASTER);
	
	// 删除一个PHP全局函数的handler
	$coal->off(Coal::EVENT_DISASTER, 'global_onDisaster');
	
	// 删除一个对象的成员函数的handler
	$coal->off(Coal::EVENT_DISASTER, [$baddy, 'onDisaster']);
	
	// 删除一个类的静态成员函数的handler
	$coal->off(Coal::EVENT_DISASTER, ['path\to\Baddy', 'static_onDisaster']);
	
	// 删除一个匿名函数的handler
	$coal->off(Coal::EVENT_DISASTER, $anonymousFunction);

	Event::on(
		Worker::className(),
		Worker::EVENT_OFF_DUTY,
		function ($event)
		{
			echo $event->sender . '下班了';
		});

	Event::trigger($this,$name,$event);

	$_event[$eventName][] = [$handler, $data];
	$_event[$eventName][$className][] = [$handler,$data];

	if (is_object($class)) {
		if ($event->sender === null) {
			$event->sender = $class;
		}
			$class = get_class($class);
	} else {
		$class = ltrim($class, '\\');
	}

	do {
		if (!empty(self::$_events[$name][$class])) {
			foreach (self::$_events[$name][$class] as $handler) {
				$event->data = $handler[1];
				call_user_func($handler[0],$event);

				if ($event->handled) {
					return;
				}
			}
		}
	} while (($class = get_parent_class($class)) !== false);

	Yii::$app->on('bar', function ($event)
	{
		echo get_class($event->sender);
	}); 

	Yii::$app->trigger('bar', new Event(['sender' => $this]));