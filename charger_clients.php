<?php
    ini_set('display_errors', 1);
    ini_set('display_status_errors',1);
    error_reporting(E_ALL);
    // connexion base de donnees 
    include 'connexiondb.php';
    $conn = connexionMysqli();

// Requête SQL pour sélectionner les clients
$sql = "SELECT idClient, nomClient FROM client";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $clients = array();
    while ($row = $result->fetch_assoc()) {
        $clients[] = $row;
    }
    echo json_encode($clients);
} else {
    echo json_encode(array());
}

$conn->close();
?>
