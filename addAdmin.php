<?php
// Récupérer les données du formulaire
$nom = $_POST['name'];
$login = $_POST['login'];
$password = $_POST['password'];
$etat= 'active';
// echo $nom;
// echo $prenom;
// echo $login;
// echo $password;
// echo $telephone;
// echo $idRole;
// echo ' da ',$dateAjout;
// echo ' dm ',$dateModif;

// Hacher le mot de passe md5
$hashedPassword = md5($password);


// Ici, vous devez insérer les données récupérées dans votre base de données
$servername = "localhost";
$username = "black";
$password = "black";
$dbname = "pharmacie";

// // Créer une connexion
 $conn = new mysqli($servername, $username, $password, $dbname);

// // Vérifier la connexion
if ($conn->connect_error) {
    die("Échec de la connexion à la base de données: " . $conn->connect_error);
}

// // Préparer et exécuter la requête SQL pour insérer les données
 $sql = "INSERT INTO user (nomU, login, password,etat) VALUES ('$nom',  '$login', '$hashedPassword','$etat')";

if ($conn->query($sql) === TRUE) {
    echo "L'Admin a été ajoutée avec succès !";
} else {
    echo "Erreur lors de l'ajout de l'Admin : " . $conn->error;
}

// // Fermer la connexion à la base de données
$conn->close();
?>
