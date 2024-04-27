<?php
// Vérifier si l'ID de Categorie à supprimer a été envoyé via la méthode POST
if(isset($_POST['catId'])) {
    // Récupérer l'ID de Categorie à supprimer depuis les données POST
    $catId = $_POST['catId'];

    // Connexion à la base de données
    require_once 'connexiondb.php';
    $conn = connexionMysqli();

    // Préparer la requête SQL pour mettre à jour l'état de Categorie dans la table "etat"
    $updateSql = "UPDATE categorie SET etat = 'supprimer' WHERE idCategorie = $catId";

    // Exécuter la requête SQL
    if ($conn->query($updateSql) === TRUE) {
        // Répondre avec un message de succès
        echo "L'état de la Categoriea été mis à jour avec succès.";
    } else {
        // Répondre avec un message d'erreur
        echo "Erreur lors de la mise à jour de l'état de la Categorie: " . $conn->error;
    }

    // Fermer la connexion à la base de données
    $conn->close();
} else {
    // Si l'ID de Categorie n'est pas fourni, répondre avec un message d'erreur
    echo "ID de la Categorienon fourni.";
}
?>
