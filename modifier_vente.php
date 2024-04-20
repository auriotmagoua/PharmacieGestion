<?php
    ini_set('display_errors', 1);
    ini_set('display_status_errors',1);
    error_reporting(E_ALL);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les données du formulaire
    $idVente = $_POST['idVente'];
    $idClient = $_POST['client'];
    $quantite = $_POST['quantite'];
    $prixTotal = $_POST['prixTotal'];
    $idProduit = $_POST['produit'];

    // connexion base de donnees 
    include 'connexiondb.php';
    $conn = connexionMysqli();

    // Préparer la requête de modification
    $sql = "UPDATE ventes SET idClient='$idClient', qteVente='$quantite', prixT='$prixTotal', idProd='$idProduit' WHERE idVente='$idVente'";

    // Exécuter la requête de modification
    if ($conn->query($sql) === TRUE) {
        echo "La vente a été modifiée avec succès.";
    } else {
        echo "Erreur lors de la modification de la vente : " . $conn->error;
    }

    // Fermer la connexion
    $conn->close();
}
?>
