<?php
// // Code de connexion à la base de données 
// include 'connexiondb.php';
// $conn = connexionMysqli();

function getApprovisionnemement($idprod){
$conn = connexionMysqli();

    $sql = "SELECT IFNULL(SUM(approvisionnement.qteAppro), 0) AS sum_qteAppro
    FROM approvisionnement
    WHERE approvisionnement.etat = 'active'
    AND idProd = $idprod";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc(); 
        return $row;
    } else return 0;
}


function getVente($idprod){
$conn = connexionMysqli();

    $sql = "SELECT IFNULL(SUM(ventes.qteVente), 0) AS sum_qteVente
    FROM ventes
    where ventes.etat = 'active'
    and idProd=$idprod";
    
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Parcourir les résultats de la requête et les ajouter à un tableau
        $row = $result->fetch_assoc();
        return $row;
    }
    else return 0;
}


function getStock($idprod){
    // var_dump(getApprovisionnemement($idprod));
    return getApprovisionnemement($idprod)-getVente($idprod);
}



// Fermer la connexion à la base de données
// $conn->close();
?>

