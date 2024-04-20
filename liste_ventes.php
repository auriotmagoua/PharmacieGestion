<?php
    ini_set('display_errors', 1);
    ini_set('display_status_errors',1);
    error_reporting(E_ALL);
    
    // Code de connexion à la base de données 
    include 'connexiondb.php';
    $conn = connexionMysqli();

// Requête SQL pour récupérer les données de la table "ventes"
$sql = "SELECT idVente, dateVente, qteVente, prixT, idProd, idClient, etat FROM ventes";
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
