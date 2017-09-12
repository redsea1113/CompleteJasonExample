<?php 


    $host="localhost";
    $servername = "id2654397_testdb";
    $username = "id2654397_afarhat";
    $password = "12345666";

// Create connection
$con = new mysqli($host, $username, $password,$servername);

// Check connection 
if(mysqli_connect_errno()) 
{ 
echo "Failed to connect to MySQL: " . mysqli_connect_error(); 
} 

// This SQL statement selects ALL from the table 'Locations' 
$sql = "SELECT * FROM stores";

// Check if there are results 
if ($result = mysqli_query($con, $sql)) 
{ 


    $rows = array();
    while($r = $result->fetch_object())
    {
        $rows[] = $r;
    }
    
    $data = array('Stores' => $rows);
    print json_encode($data);


}
// Close connections 
mysqli_close($con); 
exit();

?>














