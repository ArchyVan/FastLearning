<?php
function writeName()
{
  echo "Kai Jim Refsnes";
}

echo "My name is";
writeName();
function writeNameWithArg($fname)
{
  echo $fname . " Refsnes.<br>";
}
writeNameWithArg("Kai Jim");

 ?>
