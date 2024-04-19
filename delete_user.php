<?php
// Vérifier si l'ID de l'utilisateur à supprimer a été envoyé via la méthode POST
if(isset($_POST['userId'])) {
    // Récupérer l'ID de l'utilisateur à supprimer depuis les données POST
    $userId = $_POST['userId'];

    // Connexion à la base de données
    $servername = "localhost";
    $username = "black";
    $password = "black";
    $dbname = "pharmacie";

    // Créer une connexion
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Vérifier la connexion
    if ($conn->connect_error) {
        die("La connexion à la base de données a échoué: " . $conn->connect_error);
    }

    // Préparer la requête SQL pour mettre à jour l'état de l'utilisateur dans la table "etat"
    $updateSql = "UPDATE user SET etat = 'supprimer' WHERE idU = $userId";

    // Exécuter la requête SQL
    if ($conn->query($updateSql) === TRUE) {
        // Répondre avec un message de succès
        echo "L'état de l'utilisateur a été mis à jour avec succès.";
    } else {
        // Répondre avec un message d'erreur
        echo "Erreur lors de la mise à jour de l'état de l'utilisateur: " . $conn->error;
    }

    // Fermer la connexion à la base de données
    $conn->close();
} else {
    // Si l'ID de l'utilisateur n'est pas fourni, répondre avec un message d'erreur
    echo "ID de l'utilisateur non fourni.";
}
?>
