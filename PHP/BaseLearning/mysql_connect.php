<?php
$servername = "localhsot";
$username = "username";
$password = "password";

$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) {
  die("链接失败：" . $conn->connect_error);
}
echo "链接成功";

$conn->close();
 ?>

<?php
$servername = "localhsot";
$username = "username";
$password = "password";

$conn = mysqli_connect($servername, $username, $password);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "连接成功";

mysqli_close($conn);
 ?>

 <?php
 $servername = "localhsot";
 $username = "username";
 $password = "password";

 try {
     $conn = new PDO("mysql:host=$servername;dbname=myDB", $username, $password);
     echo "连接成功";
 }
 catch(PDOException $e)
 {
     echo $e->getMessage();
 }

 $conn = null;
  ?>>
