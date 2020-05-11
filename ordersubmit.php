<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

$rest_json = file_get_contents("php://input");
$_POST = json_decode($rest_json, true);
    
$host = "localhost";
$user = "root"; 
$password = "redvelvet";
$dbname = "vanillajs";
$con = mysqli_connect($host, $user, $password, $dbname);

$errors = array();
    
    $oid = uniqid();
    $date = date('Y-m-d');
    $name = $_POST['fullName'];
    $email = $_POST['email'];
    $phone = $_POST['telephone'];
    $address = $_POST['address'];
    $zip = (int)$_POST['zip'];
    $crednum = $_POST['ccNum'];
    $shipmethod = $_POST['shipMethod'];
    $cart = $_POST['cart'];
    

    $insertsql = "INSERT into Orders (oid, name, email, phone, address, zip, crednum, shipmethod, date) VALUES ('$oid','$name', '$email', '$phone', '$address', '$zip', '$crednum', '$shipmethod', '$date')";
    $insertresult = mysqli_query($con,$insertsql);
    if (!$insertresult) {
        http_response_code(404);
        die(mysqli_error($con));
    }

    foreach ($cart as $pid => $qty) {
        $createmanifest = "INSERT into OrderManifest (oid, pid, orderqty) VALUES ('$oid', '$pid', '$qty')";
        $manifestresult = mysqli_query($con,$createmanifest);
        if (!$manifestresult) {
            http_response_code(404);
            die(mysqli_error($con));
        }
    }
    

    $selectsql = "SELECT oid, name, email, phone, address, zip, shipmethod, crednum, date FROM Orders WHERE oid='$oid' ";
    $selectresult = mysqli_query($con,$selectsql);
    $selectmanifest = "SELECT oid, pid, orderqty FROM OrderManifest WHERE oid='$oid'";
    $manifestresult = mysqli_query($con, $selectmanifest);
    
    $rows = array();
    if (mysqli_num_rows($selectresult) > 0) {
        while($row = mysqli_fetch_assoc($selectresult)) {
            $rows[] = $row;
        }
          
    } else {
        echo "0 results";
    }
    if (mysqli_num_rows($manifestresult) > 0) {
        while($row = mysqli_fetch_assoc($manifestresult)) {
            $rows[] = $row;
            
        }
        echo json_encode($rows);
    }


?>
