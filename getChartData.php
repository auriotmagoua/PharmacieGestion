<?php
require_once 'connexiondb.php';
$conn = connexionMysqli();

$sql = "SELECT MONTH(dateVente) AS mois, COUNT(idVente) AS countVentes FROM ventes GROUP BY mois ORDER BY mois";

// Exécuter la requête SQL
$result = $conn->query($sql);

// Récupérer les résultats
$results = array();
while ($row = $result->fetch_assoc()) {
    $monthNumber = $row["mois"];
    $monthName = date("F", mktime(0, 0, 0, $monthNumber, 1));
    $results["labels"][] = $monthName;
    $results["data"][] = $row["countVentes"];
}

// Fermer la connexion à la base de données
$conn->close();

// Renvoyer les résultats au format JSON
header('Content-Type: application/json');
echo json_encode($results);
?>