<?php
require_once 'connexiondb.php';
$conn = connexionMysqli();
// if($conn){echo "Okk";}
// Requête SQL pour récupérer les données correspondantes
$sql = "SELECT *  FROM produit WHERE etat = 'active' LIMIT 20";
$result = $conn->query($sql);
// var_dump($result);
// Construction du tableau de résultats
$data = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = array(
            'idProd'       => $row['idProd'],
            'nomProd'      => $row['nomProd'],
            'numLot'       => $row['numLot'],
            'datePerem'    => $row['datePerem'],
            'qteDispo'     => $row['qteDispo'],
            'prixU'        => $row['prixU'],
            'idFournis'    => $row['idFournis'],
            'idCategorie'  => $row['idCategorie'],
            'imageProd'    => $row['imageProd']
        );
    }
}

// Renvoi des résultats en tant que réponse JSON
// header('Content-Type: application/json');
echo json_encode($data);

// Fermeture de la connexion à la base de données
$conn->close();
?>