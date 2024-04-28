<?php 
   function connexionMysqli(){
    $conn = new mysqli('localhost', 'root', 'Pa$$w0rd', 'pharmacie');
    // $conn = new mysqli("localhost", "auriot", "auriot", "pharmacie");
   	if ($conn){
   		return $conn;
   	}else{
       echo "Could not connect to mysql".mysqli_error($con);
       return false;
   	} 
   }
   
?>  