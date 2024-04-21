<?php
    ini_set('display_errors', 1);
    ini_set('display_status_errors', 1);
    error_reporting(E_ALL);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        include 'connexiondb.php';

        $conn = connexionMysqli();

        // Récupérer les données du formulaire
        $dateVente = date('Y-m-d');
        $idClient = $_POST['client'];
        $qteVente = $_POST['quantite'];
        $prixT = str_replace(',', '.', $_POST['prixTotal']); // Remplacer les virgules par des points pour le format du prix
        $prixT = str_replace(' FCFA', '', $prixT); // Supprimer le texte " FCFA"
        $idProd = $_POST['idProduit'];
        echo "la vente dateVente: " . $dateVente;
        echo "la vente idClient: " . $idClient;
        echo "la vente qteVente: " . $qteVente;
        echo "la vente prixT: " . $prixT;
        echo "la vente idProd: " . $idProd;

        // Préparer la requête SQL pour insérer la vente
        $sql = "INSERT INTO ventes (dateVente, qteVente, prixT, idProd, idClient)
                VALUES ('$dateVente', $qteVente, $prixT, $idProd, $idClient)";

        if ($conn->query($sql) === TRUE) {
            // Succès de l'insertion de la vente
            echo "Vente enregistrée avec succès.";
        } else {
            // Erreur lors de l'insertion de la vente
            echo "Erreur lors de l'enregistrement de la vente : " . $conn->error;
        }

        // Fermer la connexion à la base de données
        $conn->close();
    }
?>
