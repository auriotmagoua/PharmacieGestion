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

// Requête SQL pour sélectionner les produits
$sql = "SELECT idProd, nomProd FROM produit";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $produits = array();
    while ($row = $result->fetch_assoc()) {
        $produits[] = $row;
    }
    echo json_encode($produits);
} else {
    echo json_encode(array());
}

$conn->close();
?>
