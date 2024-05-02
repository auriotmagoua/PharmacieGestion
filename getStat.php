<?php
require_once 'connexiondb.php';
$conn = connexionMysqli();

$sql = "SELECT 
  (SELECT COUNT(numFact) FROM ventes) AS countVentes,
  (SELECT COUNT(idAppro) FROM approvisionnement) AS countAppro,
  (SELECT COUNT(idClient) FROM client) AS countClients,
  (SELECT COUNT(idFournis) FROM fournisseur) AS countFournisseurs";
$result = $conn->query($sql);

// Construction du tableau de résultats
$data = array();
if ($result->num_rows > 0) {
  $row = $result->fetch_assoc(); // Utilisez fetch_assoc() sans boucle car la requête retourne une seule ligne
  $data = array(
    'countVentes' => $row['countVentes'],
    'countAppro' => $row['countAppro'],
    'countClients' => $row['countClients'],
    'countFournisseurs' => $row['countFournisseurs']
  );
}

// Renvoyer la réponse en tant que JSON
header('Content-Type: application/json');
echo json_encode($data);

$conn->close();
?>
