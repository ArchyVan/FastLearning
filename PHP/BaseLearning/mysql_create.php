<?php
$servername = "localhsot";
$username = "username";
$password = "password";

$conn = new mysqli($servername,$username,$password);
if ($conn->connect_error) {
  die("链接失败：" . $conn->connect_error);
}
echo "链接成功";

$sql = "CREATE DATABASE myDB";
if ($conn->query($sql) === TRUE) {
  echo "数据库创建成功";
} else {
  echo "Error Creating Database: " . $conn->error;
}

$conn->close();
 ?>

 <?php
$servername = "localhost";
$username = "username";
$password = "password";

// 创建连接
$conn = mysqli_connect($servername, $username, $password);
// 检测连接
if (!$conn) {
    die("连接失败: " . mysqli_connect_error());
}

// 创建数据库
$sql = "CREATE DATABASE myDB";
if (mysqli_query($conn, $sql)) {
    echo "数据库创建成功";
} else {
    echo "Error creating database: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
