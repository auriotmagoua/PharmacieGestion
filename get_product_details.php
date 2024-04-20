<?php
    ini_set('display_errors', 1);
    ini_set('display_status_errors',1);
    error_reporting(E_ALL);
$conn = new mysqli("localhost", "christian", "Christian$1", "pharmacie");

// Récupérer les détails du produit en fonction de l'ID envoyé en POST
if (isset($_POST['productId'])) {
    $productId = $_POST['productId'];
    $sql = "SELECT idProd, nomProd, prixU FROM produit WHERE idProd = $productId";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode($row);
    } else {
        echo "Product not found";
    }
}

$conn->close();
?>
