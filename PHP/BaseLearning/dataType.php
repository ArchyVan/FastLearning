<?php
$x = "Hello World";
echo $x;
echo "<br>";
$x = 'Hello World';
echo $x;

$x = 5985;
var_dump($x);
echo "<br>";
$x = -345;
var_dump($x);
echo "<br>";
$x = 047;
var_dump($x);
echo "<br>";

$x = 10.365;
var_dump($x);
echo "<br>";
$x = 2.4e3;
var_dump($x);
echo "<br>";
$x = 8E-5;
var_dump($x);
echo "<br>";

$x = true;
$y = false;

$cars = array("Volvo","BMW","Toyota");
var_dump($cars);

/**
 * Car
 */
class Car
{
  var $color;
  function Car($color = "green")
  {
    $this->color = $color;
  }
  function what_color()
  {
    return $this->color;
  }
}

$x = "Hello world!";
$x = null;
var_dump($x);

 ?>
