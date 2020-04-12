<?php
$server="sql289.main-hosting.eu";
$user="u483488629_resat";
$password="resat";
$dbname="u483488629_resat";

 $conn=mysqli_connect($server,$user,$password,$dbname);

 if(mysqli_connect_error($conn))
 {
	echo "Connection Failed.<br>";
 }
?>