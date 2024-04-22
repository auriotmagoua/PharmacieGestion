<?php

include 'connexiondb.php';

$conn = connexionMysqli();

$id = $_POST['id'];

    // Requête de mise à jour
    $sql = "UPDATE produit SET etat = 'supprimer' WHERE idProd = ?";
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