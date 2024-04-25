<?php
require_once 'connexiondb.php';
$conn = connexionMysqli(); // Utilisation de votre méthode de connexion mysqli

if (count($_POST) > 0) {
    if($_POST['type']==1){

    function generateInvoiceNumber() {
    $conn = connexionMysqli(); // Utilisation de votre méthode de connexion mysqli

    // Requête pour récupérer le dernier numéro de facture
    $sql = "SELECT numFact FROM ventes ORDER BY idVente DESC LIMIT 1";
    $result = $conn->query($sql);
  
    // Vérification du résultat de la requête
    if ($result->num_rows > 0) {
      $row = $result->fetch_assoc();
      $lastInvoiceNumber = $row["numFact"];
  
      // Extraire la partie numérique du dernier numéro de facture
      $lastNumber = (int)substr($lastInvoiceNumber, -4);
      $newNumber = $lastNumber + 1;
  
      // Formater la partie numérique avec des zéros à droite
      $formattedNumber = str_pad($newNumber, 4, '0', STR_PAD_LEFT);
    } else {
      $formattedNumber = '0000'; // Si aucun enregistrement n'est trouvé, initialisez la partie numérique à '0000'
    }
  
    // Construire le nouveau numéro de facture en utilisant le format spécifié
    $newInvoiceNumber = "FACT-$formattedNumber";
  
    // Fermeture de la connexion à la base de données
    $conn->close();
  
    return $newInvoiceNumber;
    }
    

    $idClient = $_POST['idClient'];
    $productCodes = $_POST['productCode'];
    $quantities = $_POST['quantity'];
    $numFact = generateInvoiceNumber();
    $prices = $_POST['price'];
    $dateVente = date('Y-m-d');
    $etat = 'active';

    // try {
    //     $conn->begin_transaction();

        foreach ($productCodes as $key => $productCode) {
            // Préparation de la requête d'insertion
            $sql = "INSERT INTO ventes (dateVente, qteVente, numFact, idProd, idClient, etat) VALUES ('$dateVente', $quantities[$key], '$numFact', $productCodes[$key], $idClient, '$etat')";
            // Exécution de la requête
            $result = $conn->query($sql);
            $sql1 = "UPDATE produit SET qteDispo = qteDispo - $quantities[$key] WHERE idProd = $productCodes[$key]";
            $res = $conn->query($sql1);
        }

        if ($result) {
            echo json_encode(array("statusCode" => 200));
        } else {
            echo json_encode(array("statusCode" => 500, "error" => "Error: " . $sql . "\n" . $conn->error));
        }
    //     $conn->commit();
    //     // Envoi du code de statut 200 (réussite)
    //     echo json_encode(array("statusCode" => 200));
    // } catch (Exception $e) {
    //     $conn->rollback();
    //     // En cas d'erreur, renvoie du code de statut 500 (erreur interne du serveur)
    //     echo json_encode(array("statusCode" => 500, "error" => "Error: " . $sql . "\n" . $conn->error));

    // }
}
}
?>
