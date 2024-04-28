<?php
 
/*
 * DataTables example server-side processing script.
 *
 * Please note that this script is intentionally extremely simple to show how
 * server-side processing can be implemented, and probably shouldn't be used as
 * the basis for a large complex system. It is suitable for simple use cases as
 * for learning.
 *
 * See https://datatables.net/usage/server-side for full details on the server-
 * side processing requirements of DataTables.
 *
 * @license MIT - https://datatables.net/license_mit
 */
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Easy set variables
 */
 
// DB table to use
$table = 'produit';
// $table = 'ventes';
 
// Table's primary key
$primaryKey = 'idProd';
// $primaryKey = 'idVente';
 
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple

$mysqli = new mysqli('localhost', 'root', 'Pa$$w0rd', 'pharmacie');
// Vérifier la connexion
if ($mysqli->connect_errno) {
    echo "Erreur de connexion à la base de données : " . $mysqli->connect_error;
    // Gérer l'erreur de connexion selon vos besoins
    exit();
}

$requete = "SELECT IFNULL(SUM(ventes.qteVente), 0) AS somme_des_qtes_vendu
            FROM produit 
            LEFT JOIN ventes ON produit.idProd = ventes.idProd 
            GROUP BY produit.idProd";

$resultat = $mysqli->query($requete);

if (!$resultat) {
    echo "Erreur lors de l'exécution de la requête : " . $mysqli->error;
    // Gérer l'erreur d'exécution de la requête selon vos besoins
    exit();
}

$row = $resultat->fetch_assoc();
$somme_des_qtes_vendu = $row['somme_des_qtes_vendu'];
// indexes
$columns = array(
    // array( 'db' => 'idClient',      'dt' => 0 ),
    array( 'db' => 'nomProd', 'dt' => 0 ), // Colonne pour le nom du produit
    // array( 'db' => 'somme_des_qtes_vendu', 'dt' => 1 )
    
    // array( 'db' => 'emailClient',   'dt' => 2 ),
    // array( 'db' => 'telephoneClient',     'dt' => 3 ),
    // array(
    //     'db'        => 'image',
    //     'dt'        => 3,
    //     'formatter' => function($d, $row) {
    //         return '<img src="'.$d.'" alt="Image du produit" class="product-image"  width="100px" height="100px">';
    //     }
    // ),
    // array( 'db' => 'poid',      'dt' => 5 ),
    // array( 'db' => 'prixU',     'dt' => 4 ),
    // array( 'db' => 'prixV',     'dt' => 5 ),
    // array( 'db' => 'dateAjout', 'dt' => 8 ),
    // array( 'db' => 'dateModif', 'dt' => 9 ),
    // array( 'db' => 'idUser',    'dt' => 6 ),
    // array( '<button>delete</button>', 11 )
    // array(
    //     'db'        => 'start_date',
    //     'dt'        => 12,
    //     'formatter' => function( $d, $row ) {
    //         return date( 'jS M y', strtotime($d));
    //     }
    // ),
    // array(
    //     'db'        => 'salary',
    //     'dt'        => 13,
    //     'formatter' => function( $d, $row ) {
    //         return '$'.number_format($d);
    //     }
    // )
);

$resultat->free(); // Libérer les résultats de la requête
$mysqli->close(); // Fermer la connexion à la base de données
 
// SQL server connection information
$sql_details = array(
    'user' => 'root',
    'pass' => 'Pa$$w0rd',
    'db'   => 'pharmacie',
    'host' => 'localhost'
    // ,'charset' => 'utf8' // Depending on your PHP and MySQL config, you may need this
);
 
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * If you just want to use the basic configuration for DataTables with PHP
 * server-side, there is no need to edit below this line.
 */
 
require( 'ssp.class.php' );
 
// // Créez une connexion à la base de données
// $mysqli = new mysqli("localhost", "root", 'Pa$$w0rd', "pharmacie");

// // Définition de la requête pour obtenir la somme des quantités vendues par produit
// $requete = "SELECT COALESCE(SUM(ventes.qteVente), 0)
//     FROM produit
//     LEFT JOIN ventes ON produit.idProd = ventes.idProd
//     GROUP BY produit.idProd";

// // Exécution de la requête SQL
// $result = $mysqli->query($requete);

// // Vérification des erreurs d'exécution
// if (!$result) {
//     die("Erreur d'exécution de la requête: " . $mysqli->error);
// }

// // Extraction de la première ligne du résultat
// $row = $result->fetch_assoc();

// // Affichage pour le débogage
// var_dump($row);

// Ajoutez votre condition WHERE pour filtrer les lignes où l'état est 'active'
$whereClause = "etat = 'active'";

echo json_encode(
    SSP::complex( $_GET, $sql_details, $table, $primaryKey, $columns, $whereClause)
);


