<?php
include "../tet.php";
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
    $nomC = $_POST['nomC'];
    $villeC = $_POST['villeC'];
    $emailC = $_POST['emailC'];
    $telC = $_POST['telC'];

    // Préparer la requête d'insertion
    $stmt = $conn->prepare("INSERT INTO client (nomClient, villeClient, emailClient, telephoneClient,idU) 
    VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssi", $nomC, $villeC, $emailC, $telC,$idU);

    if ($stmt->execute()) {
        // echo 'succes de l\'enregistrement';
        $response = array(
            'statusCode' => 200,
            'message' => 'client ajouté avec succès'
        );
    } else {
        // echo 'echec de l\'enregistrement';
        $response = array(
            'statusCode' => 500,
            'message' => 'Erreur lors de l\'insertion du client : ' . $stmt->error
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