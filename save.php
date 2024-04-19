<?php
    // initialisation de la session
    // session_start();
    // $idU = $_SESSION["idU"];
    require_once 'connexiondb.php';
    $conn = connexionMysqli();

    if (count($_POST) > 0) {
        if($_POST['type']==1){

            // if (!empty($_FILES['image']['name'])) {
            $uploadDirectory = 'images/';
            $uploadedFileName = basename($_FILES['imageProd']['name']);
            $uploadedFileTmp = $_FILES['imageProd']['tmp_name'];
        
            // Validez et sécurisez le fichier si nécessaire
        
            $destination = $uploadDirectory . $uploadedFileName;
            move_uploaded_file($uploadedFileTmp, $destination);   
            // if (move_uploaded_file($uploadedFileTmp, $destination)) {

                // Exemple de valeurs concrètes
                $nomProd = $_POST['nomProd'];
                $numLot = $_POST['numLot'];
                $datePerem = $_POST['datePerem'];
                $qteDispo = $_POST['qteDispo'];
                $prixU = $_POST['prixU'];
                $idFournis = $_POST['fournisseur'];
                $idCategorie = $_POST['categorie'];
                // $imageProd = $_FILES['imageProd'];
                // $dateAjout = date('Y-m-d');
                // $dateModif = date('Y-m-d');
                $etat = "active";

                $sql = "INSERT INTO produit (nomProd, numLot, datePerem, qteDispo, prixU, idFournis, idCategorie, etat, imageProd) 
                VALUES ('$nomProd', $numLot, '$datePerem', $qteDispo, $prixU, $idFournis, $idCategorie, '$etat','$destination')";
                // var_dump($sql);
                $result = $conn->query($sql);
                if ($result) {
                    echo json_encode(array("statusCode" => 200));
                } else {
                    echo json_encode(array("statusCode" => 500, "error" => "Error: " . $sql . "\n" . $conn->error));
                }
            // }
        }

    }
// }
?>