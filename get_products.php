<?php
    ini_set('display_errors', 1);
    ini_set('display_status_errors',1);
    error_reporting(E_ALL);
$conn = new mysqli("localhost", "christian", "Christian$1", "pharmacie");


// Récupérer tous les produits de la base de données
$sql = "SELECT idProd, nomProd, prixU FROM produit";
$result = $conn->query($sql);

$products = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
}

// Renvoyer les produits au format JSON
header('Content-Type: application/json');
echo json_encode($products);

$conn->close();
?>
