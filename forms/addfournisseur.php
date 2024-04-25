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
    $nomF = $_POST['nomF'];
    $villeF = $_POST['villeF'];
    $emailF = $_POST['emailF'];
    $telF = $_POST['telF'];
    $etat = "active";

    // Préparer la requête d'insertion
    $stmt = $conn->prepare("INSERT INTO fournisseur (nomFournis, villeFournis, emailFournis, telephoneFournis, etat) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $nomF, $villeF, $emailF, $telF, $etat);

    if ($stmt->execute()) {
        // echo 'succes de l\'enregistrement';
        $response = array(
            'statusCode' => 200,
            'message' => 'fournisseur ajouté avec succès'
        );
    } else {
        // echo 'echec de l\'enregistrement';
        $response = array(
            'statusCode' => 500,
            'message' => 'Erreur lors de l\'insertion du forunisseur : ' . $stmt->error
        );
    }

    // Fermer la connexion et libérer les ressources
    $stmt->close();
    // Fermer la connexion
    $conn->close();

    // Retourner la réponse au format JSON
    header('Content-Type: application/json');
    echo json_encode($response);
}
?>