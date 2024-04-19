<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
   
    include '../connexionBD.php';

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

    // Récupérer les données du formulaire
    $id = $_POST['idC1'];
    $nomC = $_POST['nomC1'];
    $villeC = $_POST['villeC1'];
    $emailC = $_POST['emailC1'];
    $telC = $_POST['telC1'];

    // Préparer la requête de modification
    $sql = "UPDATE client SET nomClient=?, villeClient=?, emailClient=?, telephoneClient=?  WHERE idClient=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssi", $nomC, $villeC, $emailC, $telC, $id);

    if ($stmt->execute()) {
        // Les informations du produit ont été mises à jour avec succès
        $response = array(
            'statusCode' => 200,
            'message' => 'Modification du client réussie'
        );
    } else {
        // Une erreur s'est produite lors de la mise à jour des informations du produit
        $response = array(
            'statusCode' => 500,
            'message' => 'Erreur lors de la mise à jour des informations du client: ' . $conn->error
        );
    }

    // Fermer la connexion à la base de données
    $stmt->close();
    // Fermer la connexion
    $conn->close();

    // Retourner la réponse au format JSON
    header('Content-Type: application/json');
    echo json_encode($response);
}
?>