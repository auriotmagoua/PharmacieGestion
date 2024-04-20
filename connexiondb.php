<?php 
   function connexionMysqli(){
    // $conn= new mysqli('localhost','auriot','auriot','pharmacie');
    $conn = new mysqli("localhost", "christian", "Christian$1", "pharmacie");
   	if ($conn){
   		return $conn;
   	}else{
       echo "Could not connect to mysql".mysqli_error($con);
       return false;
   	} 
   }
   
?>