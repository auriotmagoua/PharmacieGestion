<?php
require_once('tet.php');
session_start();

// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['idU'])) {
    // Rediriger vers la page de connexion ou afficher un message d'erreur
    exit("Erreur: Vous devez être connecté pour ajouter une catégorie.");
}
// Récupération des données du formulaire
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $nomCategorie = $_POST["categoryName"];
    $etat = "active"; // Vous pouvez définir l'état par défaut ici

    // Connexion à la base de données
    require_once 'connexiondb.php';
    $conn = connexionMysqli();

    // Préparation de la requête d'insertion
    $stmt = $conn->prepare("INSERT INTO categorie (nomCategorie, etat,idU) VALUES (?, ?,?)");

    // Vérification de la préparation de la requête
    if ($stmt === false) {
        die("Erreur de préparation de la requête: " . $conn->error);
    }

    // Liaison des paramètres
    $stmt->bind_param("ssi", $nomCategorie, $etat,$idU);

    // Exécution de la requête
    if ($stmt->execute() === true) {
        echo "Catégorie ajoutée avec succès.";
    } else {
        echo "Erreur lors de l'ajout de la catégorie: " . $stmt->error;
    }

    // Fermeture du statement
    $stmt->close();

    // Fermeture de la connexion
    $conn->close();
}
?>
