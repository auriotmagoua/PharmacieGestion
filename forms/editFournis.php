<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
   
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

    // Récupérer les données du formulaire
    $id = $_POST['idF1'];
    $nom = $_POST['nomF1'];
    $ville = $_POST['villeF1'];
    $email = $_POST['emailF1'];
    $tel = $_POST['telF1'];

    // Préparer la requête de modification
    $sql = "UPDATE fournisseur SET nomFournis=?, villeFournis=?, emailFournis=?, telephoneFournis=?  WHERE idFournis=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssi", $nom, $ville, $email, $tel, $id);

    if ($stmt->execute()) {
        // Les informations du produit ont été mises à jour avec succès
        $response = array(
            'statusCode' => 200,
            'message' => 'Modification du fournisseur réussie'
        );
    } else {
        // Une erreur s'est produite lors de la mise à jour des informations du produit
        $response = array(
            'statusCode' => 500,
            'message' => 'Erreur lors de la mise à jour des informations du fournisseur: ' . $conn->error
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