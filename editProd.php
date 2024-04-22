<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
   
    include 'connexiondb.php';

    $conn = connexionMysqli();
    $uploadDirectory = 'images/';
    $uploadedFileName = basename($_FILES['imageProd']['name']);
    $uploadedFileTmp = $_FILES['imageProd']['tmp_name'];

    // Validez et sécurisez le fichier si nécessaire

    $destination = $uploadDirectory . $uploadedFileName;
    move_uploaded_file($uploadedFileTmp, $destination);   
    // Récupérer les données du formulaire
    $idProd = $_POST['idProd'];
    $nomProd = $_POST['nomProd'];
    $numLot = $_POST['numLot'];
    // $imageProd = $_POST['imageProd'];
    $datePerem = $_POST['datePerem'];
    $qteDispo = $_POST['qteDispo'];
    $prixU = $_POST['prixU'];
    $idCategorie = $_POST['idCategorie'];

        // Préparer la requête de modification
    $sql = "UPDATE produit SET nomProd=?, numLot=?, imageProd=?, datePerem=?, qteDispo=?, prixU=?, idCategorie=? WHERE idProd=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssssssi", $nomProd, $numLot, $destination, $datePerem, $qteDispo, $prixU, $idCategorie, $idProd); // Ajouter $idProd à la fin des paramètres
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
            'message' => 'Erreur lors de la mise à jour des informations du produit: ' . $conn->error
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