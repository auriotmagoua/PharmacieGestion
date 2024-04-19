<?php
require_once 'connexiondb.php';
$conn = connexionMysqli();
// Récupération du terme de recherche depuis la requête GET
// $term = $_GET['term'];

// Requête SQL pour récupérer les données correspondantes
$sql = "SELECT idCategorie,nomCategorie FROM categorie  LIMIT 10";
$result = $conn->query($sql);

// Construction du tableau de résultats
$data = array();
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $data[] = array(
        'idCategorie' => $row['idCategorie'],
        'nomCategorie' => $row['nomCategorie']
    );
  }
}
// Renvoi des résultats en tant que réponse JSON
echo json_encode($data);

// Fermeture de la connexion à la base de données
$conn->close();
?>