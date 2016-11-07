<?php
// $int = 123;
// if (!filter_var($int,FILTER_VALIDATE_INT)) {
//   echo "不是一个合法的整数";
// } else {
//   echo "是一个合法的整数";
// }

$var = 300;

$int_options = array(
  "options"=>array(
    'min_range' => 0,
    'max_range' =>256
  )
);

if (!filter_var($var,FILTER_VALIDATE_INT,$int_options)) {
  echo "不是一个合法的整数";
} else {
  echo "是一个合法的整数";
}

if (!filter_has_var(INPUT_GET,"email")) {
  echo "没有 email 参数";
} else {
  if (!filter_input(INPUT_GET,"email",FILTER_VALIDATE_EMAIL)) {
    echo "不是一个合法的E-Mail";
  } else {
    echo "是一个合法的E-Mail";
  }
}

if (!filter_has_var(INPUT_GET,"url"))
{
  echo("没有url参数");
} else {
  $url = filter_input(INPUT_GET,"url",FILTER_SANITIZE_URL);
  echo $url;
}

$filters = array
(
	"name" => array
	(
		"filter"=>FILTER_SANITIZE_STRING
	),
	"age" => array
	(
		"filter"=>FILTER_VALIDATE_INT,
		"options"=>array
		(
			"min_range"=>1,
			"max_range"=>120
		)
	),
	"email"=> FILTER_VALIDATE_EMAIL
);

$result = filter_input_array(INPUT_GET, $filters);

if (!$result["age"])
{
	echo("年龄必须在 1 到 120 之间。<br>");
}
elseif(!$result["email"])
{
	echo("E-Mail 不合法<br>");
}
else
{
	echo("输入正确");
}

function convertSpace($string)
{
	return str_replace("_", ".", $string);
}

$string = "www_runoob_com!";

echo filter_var($string, FILTER_CALLBACK,
array("options"=>"convertSpace"));

 ?>
