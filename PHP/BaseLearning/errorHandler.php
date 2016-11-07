<?php
// if (!file_exists("welcome.txt")) {
//   die("文件不存在");
// } else {
//   $file = fopen("welcome.txt","r");
// }

function customError($errno,$errstr)
{
  echo "<b>Error:</b>[$errno] $errstr<br>";
  echo "脚本结束";
  die();
}

set_error_handler("customError",E_USER_WARNING);
echo($test);

$test = 2;
if ($test > 1) {
  trigger_error("变量值必须小于等于 1",E_USER_WARNING);
}

 ?>

 <?php
// 错误处理函数
function customError($errno, $errstr)
{
	echo "<b>Error:</b> [$errno] $errstr<br>";
	echo "已通知网站管理员";
	error_log("Error: [$errno] $errstr",1,
	"someone@example.com","From: webmaster@example.com");
}

// 设置错误处理函数
set_error_handler("customError",E_USER_WARNING);

// 触发错误
$test=2;
if ($test>1)
{
	trigger_error("变量值必须小于等于 1",E_USER_WARNING);
}
?>
