<?php
function checkNum($number)
{
  if ($number > 1) {
    throw new Exception("Value must be 1 or below");
  }
  return true;
}

// checkNum(2);
// try {
//   checkNum(2);
//   echo "If print this content, the variable number is below 2";
// } catch (Exception $e) {
//   echo "Message :" . $e->getMessage();
// }

/**
 * customException
 */
// class customException extends Exception
// {
//   public function errorMessage()
//   {
//     $errorMsg = '错误行号 ' . $this->getLine() . ' in ' . $this->getFile() . ": <b>" . $this->getMessage() . '</b>不是一个合法的E-Mail地址';
//     return $errorMsg;
//   }
// }
//
// $email = "someone@example...com";
// try
// {
// 	// 检测邮箱
// 	if(filter_var($email, FILTER_VALIDATE_EMAIL) === FALSE)
// 	{
// 		// 如果是个不合法的邮箱地址，抛出异常
// 		throw new customException($email);
// 	}
// 	// 检测 "example" 是否在邮箱地址中
// 	if(strpos($email, "example") !== FALSE)
// 	{
// 		throw new Exception("$email 是 example 邮箱");
// 	}
// }
// catch (customException $e)
// {
// 	echo $e->errorMessage();
// }
// catch(Exception $e)
// {
// 	echo $e->getMessage();
// }
// class customException extends Exception
// {
// 	public function errorMessage()
// 	{
// 		// 错误信息
// 		$errorMsg = $this->getMessage().' 不是一个合法的 E-Mail 地址。';
// 		return $errorMsg;
// 	}
// }
//
// $email = "someone@example.com";
//
// try
// {
// 	try
// 	{
// 		// 检测 "example" 是否在邮箱地址中
// 		if(strpos($email, "example") !== FALSE)
// 		{
// 			// 如果是个不合法的邮箱地址，抛出异常
// 			throw new Exception($email);
// 		}
// 	}
// 	catch(Exception $e)
// 	{
// 		// 重新抛出异常
// 		throw new customException($email);
// 	}
// }
// catch (customException $e)
// {
// 	// 显示自定义信息
// 	echo $e->errorMessage();
// }
function myException($exception)
{
  echo "<b>Exception:</b> ", $exception->getMessage();
}

set_exception_handler('myException');

throw new Exception("Uncaught Exception occurred");

 ?>
