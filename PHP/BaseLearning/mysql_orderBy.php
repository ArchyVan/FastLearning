<?php
$con=mysqli_connect("localhost","username","password","database");
// 检测连接
if (mysqli_connect_errno())
{
	echo "连接失败: " . mysqli_connect_error();
}

$result = mysqli_query($con,"SELECT * FROM Persons ORDER BY age");

while($row = mysqli_fetch_array($result))
{
	echo $row['FirstName'];
	echo " " . $row['LastName'];
	echo " " . $row['Age'];
	echo "<br>";
}

mysqli_close($con);
?>
