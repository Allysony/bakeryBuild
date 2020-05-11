<?php
header("Access-Control-Allow-Origin: *");


$host = "localhost";
$user = "root"; 
$password = "redvelvet";
$dbname = "vanillajs";
$con = mysqli_connect($host, $user, $password, $dbname);

$selectsql = "SELECT * FROM Products";
$selectresult = mysqli_query($con,$selectsql);

$rows = array();
if (mysqli_num_rows($selectresult) > 0) {
    while($row = mysqli_fetch_assoc($selectresult)) {
        $rows[] = $row;
    }
    echo json_encode($rows);
}



?>