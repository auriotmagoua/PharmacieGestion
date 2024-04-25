
<?php

include '../connexiondb.php';

$conn = connexionMysqli();
// Récupération du terme de recherche depuis les paramètres GET
$searchTerm = $_GET['search'];

// Requête SQL pour rechercher les produits correspondants dans la table "produit"
$sql = "SELECT * FROM produit WHERE nomProd LIKE '%$searchTerm%' LIMIT 10";
$result = $conn->query($sql);

// Construction du tableau des résultats
$results = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $results[] = [
            'id' => $row['idProd'],
            'text' => $row['nomProd']
        ];
    }
}

// Fermeture de la connexion à la base de données
$conn->close();

// Envoi des résultats au format JSON
header('Content-Type: application/json');
echo json_encode($results);
?>