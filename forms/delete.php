<?php

include '../connexiondb.php';

$conn = connexionMysqli();
// Vérifier si la connexion a échoué
if ($conn->connect_error) {
    $response = array(
        'statusCode' => 500,
        'message' => 'Erreur de connexion à la base de données : ' . $conn->connect_error
    );
    header('Content-Type: application/json');
    echo json_encode($response);
    exit;
}
$id = $_POST['id'];

    // Requête de mise à jour
    $sql = "UPDATE fournisseur SET etat = 'supprimer' WHERE idFournis = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);

    $response = array();

    if ($stmt->execute()) {
        // Mise à jour réussie
        $response = array(
        'statusCode' => 200,
        'message' => 'Mise à jour de l\'état du fournisseur réussie'
    );
    } else {
        // Erreur lors de la mise à jour
        $response = array(
            'statusCode' => 500,
            'message' => 'Erreur lors de la mise à jour de l\'état du fournisseur : ' . $conn->error
        );
    }

    // Fermer la connexion à la base de données
    $stmt->close();
    $conn->close();

    // Envoyer la réponse JSON
    echo json_encode($response);
?>