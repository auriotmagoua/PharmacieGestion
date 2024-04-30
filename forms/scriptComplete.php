<?php
// Inclure le fichier de connexion à la base de données
include '../connexiondb.php';

$conn = connexionMysqli();

// Récupérer le terme de recherche
if (isset($_GET['term'])) {
    $term = $_GET['term'];
    $suggestions = array();

    // Requête SQL pour rechercher les correspondances dans la table produit
    $sql = "SELECT nomFournis FROM fournisseur WHERE nomFournis LIKE '%$term%'";
    $result = $conn->query($sql);

    // Parcourir les résultats et ajouter les suggestions
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $suggestions[] = $row['nomFournis'];
        }
    }

    // Renvoyer les suggestions au format JSON
    echo json_encode($suggestions);
}

// Fermer la connexion à la base de données
$conn->close();
?>

