     <!-- fake user -->
<?php
include "connexion.php";
$conn = connexionMsqli();
require 'autoload.php';
use DateTime;
$faker = Faker\Factory::create('en_EN');
 for($i = 0; $i< 10; $i++){
     $sql = "INSERT INTO user(nom,prenom,login,password,telephone,idRole,dateAjout,dateModif) 
     VALUES ('".$faker->firstName."','".$faker->lastName."','".$faker->userName."','".$faker->password."','".$faker->e164PhoneNumber."','".$faker->randomNumber."','".$faker->dateTime->format('Y-m-d H:i:s')."','".$faker->dateTime->format('Y-m-d H:i:s')."')";
 $query = $conn->query($sql);
   // var_dump($query);
        echo $query;  
 }
 if (!$query) {
      echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
 
     // <!-- fake product  -->

     for($i = 0; $i< 100000; $i++){
          $sql = "INSERT INTO produit (codeProd, nomProd, description, image, poid, prixU, prixV, dateAjout, dateModif, idUser, etat) 
          VALUES ('" . $faker->unique()->randomNumber() . "', '" . $faker->word . "', '" . $faker->sentence . "', '" . $faker->imageUrl() . "', '" . $faker->randomFloat(2, 0, 1000) . "', '" . $faker->randomFloat(2, 0, 1000) . "', '" . ($faker->randomFloat(2, 0, 1000) * 1.2) . "', '" . $faker->date('Y-m-d') . "', '" . $faker->date('Y-m-d') . "', '" . $faker->numberBetween(1, 10) . "', 'active')";
  
          $query = $conn->query($sql);
           // var_dump($query);
             echo $query;  
          }
          if (!$query) {
           echo "Error: " . $sql . "<br>" . mysqli_error($conn);
         }






?>
