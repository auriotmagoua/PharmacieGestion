<?php

include 'connexiondb.php';
$conn = connexionMysqli();

// Récupération de la date d'aujourd'hui
$dateAujourdhui = date('Y-m-d');

// Calcul de la date dans 7 jours
$datePeremption = date('Y-m-d', strtotime('+7 days'));

// Requête SQL pour sélectionner les produits
$query = "SELECT * FROM produit WHERE datePerem BETWEEN :dateAujourdhui AND :datePeremption";
$stmt = $conn->prepare($query);
$stmt->bindParam(':dateAujourdhui', $dateAujourdhui);
$stmt->bindParam(':datePeremption', $datePeremption);
$stmt->execute();

// Vérification du succès de la requête
if ($stmt->rowCount() > 0) {
    // Des produits ont été trouvés
    http_response_code(200); // Code de statut 200 - OK
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result);
} else {
    // Aucun produit trouvé
    http_response_code(204); // Code de statut 204 - No Content
    echo json_encode(array('message' => 'Aucun produit trouvé.'));
}

// Fermeture de la connexion à la base de données
$conn = null;
?>

?>