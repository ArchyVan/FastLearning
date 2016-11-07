<?php
$x = 10;
$y = 6;
echo ($x + $y);
echo ($x - $y);
echo ($x * $y);
echo ($x / $y);
echo ($x % $y);
var_dump(intdiv(10,3));

$x += 10;
$y -= 20;
$x *= 6;
$y /= 20;
$x %= 4;

$a = "Hello";
$b = $a . " world!";
echo $b;
$x = "Hello";
$x .= " world!";
echo $x;

$x = 10;
echo ++$x;
$y = 10;
echo $y++;

$x = 100;
$y ="100";
var_dump($x==$y);
echo "<br>";
var_dump($x===$y);
echo "<br>";
var_dump($x != $y);
echo "<br>";
var_dump($x !== $y);
echo "<br>";

$a = 50;
$b = 90;

var_dump($a > $b);
echo "<br>";
var_dump($a < $b);
echo "<br>";

$x = array("a" => "red", "b" => "green");
$y = array("c" => "blue", "d" => "yellow");
$z = $x + $y; // $x 和 $y 数组合并
var_dump($z);
var_dump($x == $y);
var_dump($x === $y);
var_dump($x != $y);
var_dump($x <> $y);
var_dump($x !== $y);

and == &&
or == ||
xor //异或
! // 非

$test;
$username = isset($test) ? $test : 'nobody';
echo $username, PHP_EOL;

$username = $test ?: 'nobody';
echo $username. PHP_EOL;

$username = $_GET['user'] ?? 'nobody';
$username = isset($_GET['user']) ? $_GET['user'] : 'nobody';

echo 1 <=> 1; // 0
echo 1 <=> 2; // -1
echo 2 <=> 1; // 1

// 浮点型
echo 1.5 <=> 1.5; // 0
echo 1.5 <=> 2.5; // -1
echo 2.5 <=> 1.5; // 1

// 字符串
echo "a" <=> "a"; // 0
echo "a" <=> "b"; // -1
echo "b" <=> "a"; // 1

 ?>
