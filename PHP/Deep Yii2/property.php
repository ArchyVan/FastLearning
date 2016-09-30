<?php
	class NotAndGate extends Object
	{
		private $_key1;
		private $_key2;

		public function setKey1($value)
		{
			$this->_key1 = $value;
		}

		public function setKey2($value)
		{
			$this->_key2 = $value;
		}

		public function FunctionName($value='')
		{
			if (!$this->_key1 || !$this->_key2)
				return true;
			else if ($this->_key1 && $this->_key2)
				return false;
		}			
	}

	public function __get($name)
    {
        $getter = 'get' . $name;
        if (method_exists($this, $getter)) {
            return $this->$getter();
        } elseif (method_exists($this, 'set' . $name)) {
            throw new InvalidCallException('Getting write-only property: ' . get_class($this) . '::' . $name);
        } else {
            throw new UnKnownPropertyException('Getting unknown property: ' . get_class($this) . '::' . $name);
        }
    }

    public function __set($name, $value)
    {
        $setter = 'set' . $name;
        if (method_exists($this, $setter)) {
            $this->$setter($value);          // 调用setter函数
        } elseif (method_exists($this, 'get' . $name)) {
            throw new InvalidCallException('Setting read-only property: ' .
                get_class($this) . '::' . $name);
        } else {
            throw new UnknownPropertyException('Setting unknown property: '
                . get_class($this) . '::' . $name);
        }
    }

    class Post extends yii\base\Object
    {
        private $_title;

        /**
         * @return mixed
         */
        public function getTitle()
        {
            return $this->_title;
        }

        /**
         * @param mixed $title
         */
        public function setTitle($title)
        {
            $this->_title = trim($title);
        }
    }

    $obj = new Post();
    $title = $obj->getTitle();
    $obj->setTitle($value);

    public static function configure($object, $properties)
    {
        foreach ($properties as $name => $value) {
            $object->$name = $value;
        }
        return $object;
    }