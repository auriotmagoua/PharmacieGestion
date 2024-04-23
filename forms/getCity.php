<?php
// Inclure le fichier de connexion à la base de données
include '../connexiondb.php';

$conn = connexionMysqli();

// Récupérer le terme de recherche
if (isset($_GET['name'])) {
    // Récupérer le nom sélectionné
    $selectedName = $_GET['name'];

    // Recherchez la ville correspondant au nom sélectionné
    $selectedCity = "";

    // Requête SQL pour rechercher les correspondances dans la table produit
    $sql = "SELECT villeFournis FROM fournisseur WHERE nomFournis = '$selectedName'";
    $result = $conn->query($sql);

    foreach ($results as $result) {
        if ($result['name'] === $selectedName) {
            $selectedCity = $result['city'];
            break;
        }
    }

    // Préparez la réponse JSON
    $response = array(
        'city' => $selectedCity
    );

    // Renvoyer la réponse au format JSON
    header('Content-Type: application/json');
    echo json_encode($response);
}

?>