<?php

require_once('ssp.class.php');

// Paramètres de connexion à la base de données
$sql_details = array(
    'user' => 'root',
    'pass' => 'Pa$$w0rd',
    'db'   => 'pharmacie',
    'host' => 'localhost'
);

// Fonction pour récupérer la quantité d'approvisionnement d'un produit
function getApprovisionnement($idProd) {
    $con = new mysqli("localhost", "root", 'Pa$$w0rd', "pharmacie");
    $sql = "SELECT IFNULL(SUM(approvisionnement.qteAppro), 0) AS sum_qteAppro 
            FROM approvisionnement 
            WHERE etat = 'active' AND idProd = $idProd";
    $result = $con->query($sql); 
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row['sum_qteAppro'];
    } else {
        return 0;
    }
}

// Fonction pour récupérer la quantité de vente d'un produit
function getVente($idProd) {
    $con = new mysqli("localhost", "root", 'Pa$$w0rd', "pharmacie");
    $sql = "SELECT IFNULL(SUM(ventes.qteVente), 0) AS sum_qteVente
            FROM ventes
            WHERE etat = 'active' AND idProd = $idProd";
    $result = $con->query($sql);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row['sum_qteVente'];
    } else {
        return 0;
    }
}

// Fonction pour calculer la quantité en stock d'un produit
function getStock($idProd) {
    return getApprovisionnement($idProd) - getVente($idProd);
}


// Table utilisée
$table = 'produit';

// Clé primaire
$primaryKey = 'idProd';

// Colonnes à récupérer
$columns = array(
    array( 'db' => 'nomProd',     'dt' => 0 ),
    array( 'db' => 'idProd',      'dt' => 1 ),
    array( 'db' => 'idProd',      'dt' => 2 ),
    array( 'db' => 'idProd',      'dt' => 3 ),
);


// Condition WHERE
$whereClause = "etat = 'active'";


// Génération de la réponse JSON
$data = SSP::complex( $_GET, $sql_details, $table, $primaryKey, $columns, $whereClause );

foreach ($data['data'] as &$row) {
    $idProd = $row[1];
    $row[1] = getApprovisionnement($idProd); // Remplace la valeur de la colonne 1 par la quantité approvisionnée
    $row[2] = getVente($idProd); // Remplace la valeur de la colonne 2 par la quantité vendue
    $row[3] = getStock($idProd); // Remplace la valeur de la colonne 3 par la quantité en stock
}

echo json_encode($data);

?>
