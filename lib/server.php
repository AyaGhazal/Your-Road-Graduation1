
<?php
require 'vendor/autoload.php';  
$clie = new MongoDB\Client(
   " mongodb://localhost:27017"
                        );

$db = $cli->howYourRoad;
$collection = $db->userinfos; 
$collection->insertOne( [ 'fullname' =>'Peter','id'=>'10101010', 'email' =>'peter@abc.com','password'=>'478965','gender'=>'male','lat'=>'14','long'=>'144','age'=>'21','point'=>'4' ] );  
// Fetching Record  
$record = $collection->find( [ 'fullname' =>'Peter'] );  
foreach ($record as $employe) {  
echo $employe['fullname'], ': ', $employe['email']."<br>";  
}
?>