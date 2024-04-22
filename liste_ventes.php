<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$conn = new mysqli("localhost", "christian", "Christian$1", "pharmacie");
// Requête SQL pour récupérer les données de la table "ventes" avec jointure
$sql = "SELECT v.idVente, v.dateVente, v.qteVente, v.prixT, p.nomProd, c.nomClient, v.etat
        FROM ventes v
        JOIN produit p ON v.idProd = p.idProd
        JOIN client c ON v.idClient = c.idClient";

$result = $conn->query($sql);

$data = array();

if ($result->num_rows > 0) {
    // Parcourir les résultats de la requête et les ajouter à un tableau
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

// Fermer la connexion à la base de données
$conn->close();

// Renvoyer les données au format JSON
echo json_encode($data);
?>
