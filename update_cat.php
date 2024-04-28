<?php
// Connexion à la base de données (vous devrez peut-être modifier ces paramètres)
require_once 'connexiondb.php';
$conn = connexionMysqli();

// Vérifier si les données POST sont présentes
if(isset($_POST['catId']) && isset($_POST['newCatName'])) {
    // Récupérer l'ID de la catégorie et le nouveau nom de la catégorie depuis les données POST
    $catId = $_POST['catId'];
    $newCatName = $_POST['newCatName'];

    // Préparer la requête SQL pour mettre à jour la catégorie dans la base de données
    $sql = "UPDATE categorie SET nomCategorie='$newCatName' WHERE idCategorie='$catId'";

    // Exécuter la requête SQL
    if ($conn->query($sql) === TRUE) {
        echo "La catégorie a été modifiée avec succès.";
    } else {
        echo "Une erreur est survenue lors de la modification de la catégorie: " . $conn->error;
    }

    // Fermeture de la connexion
    $conn->close();
}
?>
