<?php
//require_once 'connexiondb.php';

//$con = connexionMysqli();

function getApprovisionnement($idProd){
    $con = new mysqli("localhost", "auriot", "auriot", "pharmacie");
  $sql = "SELECT IFNULL(SUM(approvisionnement.qteAppro), 0) AS sum_qteAppro 
  FROM approvisionnement where etat = 'active' and idProd=$idProd";
  $result = $con->query($sql);
  $row = $result->fetch_assoc();
  return $row['sum_qteAppro'];
}

function getVente($idProd){
    $con = new mysqli("localhost", "auriot", "auriot", "pharmacie");
  $sql = "SELECT IFNULL(SUM(ventes.qteVente), 0) AS sum_qteVente
  FROM ventes
  where etat = 'active'  and idProd=$idProd";
  $result = $con->query($sql);
  if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    return $row['sum_qteVente'];
  }
  else return 0;
}

function getstock($idProd) {
  return getApprovisionnement($idProd)-getVente($idProd);
}

// Fermeture de la connexion à la base de données
//$con->close();
?>