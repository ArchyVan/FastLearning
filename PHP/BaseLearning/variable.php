<?php
$x = 5;
$y = 10;

function myTest()
{
  global $x,$y;
  $y = $y + $x;
}
myTest();
echo $y;

function secondeTest()
{
  static $x = 0;
  echo $x;
  $x++;
}

secondeTest();
secondeTest();
secondeTest();
  ?>
