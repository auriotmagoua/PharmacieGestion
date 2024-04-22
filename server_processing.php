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
//  require_once "../connexiondb.php";
//  $conn = connexionMsqli();
// DB table to use
$table = 'produit';
 
// Table's primary key
$primaryKey = 'idProd';
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
$columns = array(
    array( 'db' => 'idProd', 'dt'             => 0 ),
    array( 'db' => 'nomProd',   'dt'          => 1 ),
    array(
        'db' => 'imageProd',
        'dt' => 2,
        'formatter' => function($data, $row) {
            // Générer le code HTML pour afficher l'image
            $imageHTML = '<img src="' . $data . '"  width="70" height="80">';
            
            // Retourner le code HTML de l'image
            return $imageHTML;
        }
    ),
    array( 'db' => 'numLot',   'dt'           => 3 ),
    array( 'db' => 'datePerem',   'dt'        => 4 ),
    array( 'db' => 'qteDispo',   'dt'         => 5 ),
    array( 'db' => 'prixU',      'dt'         => 6 ),
  

);
// SQL server connection information
$sql_details = array(
    'user' => 'auriot',
    'pass' => 'auriot',
    'db'   => 'pharmacie',
    'host' => 'localhost'
    // ,'charset' => 'utf8' // Depending on your PHP and MySQL config, you may need this
);
 
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * If you just want to use the basic configuration for DataTables with PHP
 * server-side, there is no need to edit below this line.
 */
$whereClause = "etat = 'active'";
 
require( 'ssp.class.php' );
 
echo json_encode(
    SSP::complex( $_GET, $sql_details, $table, $primaryKey, $columns,$whereClause)
);