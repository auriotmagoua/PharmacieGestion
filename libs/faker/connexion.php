<?php 
   function connexionMsqli(){
    $conn= new mysqli('localhost','auriot','auriot','pharmacie');
   	if ($conn){
   		return $conn;
   	}else{
       echo "Could not connect to mysql".mysqli_error($con);
       return false;
   	} 
   }
   
?>