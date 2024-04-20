<?php
    ini_set('display_errors', 1);
    ini_set('display_status_errors',1);
    error_reporting(E_ALL);

if (isset($_POST['idVente'])) {

    $conn = new mysqli("localhost", "christian", "Christian$1", "pharmacie");

    $idVente = $_POST['idVente'];
    $sql = "DELETE FROM ventes WHERE idVente = $idVente";

    // Exécuter la requête de suppression
    if ($conn->query($sql) === TRUE) {
        echo "La vente a été supprimée avec succès.";
    } else {
        echo "Erreur lors de la suppression de la vente : " . $conn->error;
    }

    // Fermer la connexion
    $conn->close();
} else {
    echo "ID de vente non fourni.";
}
?>
