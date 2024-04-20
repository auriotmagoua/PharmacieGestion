<?php
    ini_set('display_errors', 1);
    ini_set('display_status_errors',1);
    error_reporting(E_ALL);
// Code de connexion à la base de données
$conn = new mysqli("localhost", "christian", "Christian$1", "pharmacie");


// Vérifier la connexion à la base de données
if ($conn->connect_error) {
    die("Erreur de connexion à la base de données : " . $conn->connect_error);
}

// Requête SQL pour sélectionner les clients
$sql = "SELECT idClient, nomClient FROM client";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $clients = array();
    while ($row = $result->fetch_assoc()) {
        $clients[] = $row;
    }
    echo json_encode($clients);
} else {
    echo json_encode(array());
}

$conn->close();
?>
