<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    require_once 'connexiondb.php';
    $conn = connexionMysqli();

    $idU = $_POST['idU'];
    $numFact = $_POST['numFact'];
    $etat='supprimer';
        // Préparer la requête de modification
    $sql = "UPDATE ventes SET idAnnuler=?, etat=? WHERE numFact=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iss", $idU,$etat,$numFact); // Ajouter $idProd à la fin des paramètres
        if ($stmt->execute()) {
        // Les informations du produit ont été mises à jour avec succès
        $response = array(
            'statusCode' => 200,
            'message' => 'Annulation de la facture réussie'
        );
    } else {
        // Une erreur s'est produite lors de la mise à jour des informations du produit
        $response = array(
            'statusCode' => 500,
            'message' => 'Erreur lors de l\'Annulation de la facture: ' . $conn->error
        );
    }
}
    // Fermer la connexion à la base de données
    $stmt->close();
    // Fermer la connexion
    $conn->close();

    // Retourner la réponse au format JSON
    header('Content-Type: application/json');
    echo json_encode($response);
?>