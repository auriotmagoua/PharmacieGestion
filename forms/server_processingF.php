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
$table = 'fournisseur';
 
// Table's primary key
$primaryKey = 'idFournis';
 
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
$columns = array(
    array( 'db' => 'idFournis',      'dt' => 0 ),
    array( 'db' => 'nomFournis',     'dt' => 1 ),
    array( 'db' => 'villeFournis',   'dt' => 2 ),
    array( 'db' => 'emailFournis',   'dt' => 3 ),
    array( 'db' => 'telephoneFournis',     'dt' => 4 ),
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
 
// SQL server connection information
$sql_details = array(
    'user' => 'black',
    'pass' => 'black',
    'db'   => 'pharmacie',
    'host' => 'localhost'
    // ,'charset' => 'utf8' // Depending on your PHP and MySQL config, you may need this
);
 
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * If you just want to use the basic configuration for DataTables with PHP
 * server-side, there is no need to edit below this line.
 */
 
require( 'ssp.class.php' );
 
// Ajoutez votre condition WHERE pour filtrer les lignes où l'état est 'active'
$whereClause = "etat = 'active'";

echo json_encode(
    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns, $whereClause)
);

