<?php
// Connexion à la base de données et exécution de la requête de recherche
// Remplacez les valeurs ci-dessous par vos propres informations de connexion à la base de données
  require_once 'connexiondb.php';
    $connexion = connexionMysqli();

// Récupération du terme de recherche
$term = $_GET['term'];

// Requête de recherche
$sql = "SELECT * FROM user WHERE nomU LIKE '%" . $term . "%' order by nomU asc limit 10";

// Exécution de la requête
$result = $connexion->query($sql);

// Récupération des résultats
$data = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $data[] = array(
            'id' => $row['idU'],
            'text' => $row['nomU']
        );
    }
}

// Renvoi des résultats au format JSON
echo json_encode($data);

// Fermeture de la connexion à la base de données
$connexion->close();
?>