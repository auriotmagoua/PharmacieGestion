<?php
include "tet.php";
    require_once 'connexiondb.php';
    $conn = connexionMysqli();

    if (count($_POST) > 0) {
        if($_POST['type']==1){
            
            if (!empty($_FILES['imageProd1']['name'])) {
                $uploadDirectory = 'images/';
                $uploadedFileName = basename($_FILES['imageProd1']['name']);
                $uploadedFileTmp = $_FILES['imageProd1']['tmp_name'];
            
            
                $destination = $uploadDirectory . $uploadedFileName;
                move_uploaded_file($uploadedFileTmp, $destination);   

                // Exemple de valeurs concrètes
                $nomProd = $_POST['nomProd1'];
                $prixU = $_POST['prixU1'];
                $idCategorie = $_POST['categorie1'];
                // $imageProd = $_FILES['imageProd'];
                $dateAjout = date('Y-m-d');
                $dateModif = date('Y-m-d');
                $etat = "active";

                $sql = "INSERT INTO produit (nomProd, prixU, idCategorie,dateAjout,dateModif,idU, etat, imageProd) 
                VALUES ('$nomProd', $prixU, $idCategorie,'$dateAjout','$dateModif',$idU,'$etat','$destination')";
                // var_dump($sql);
                $result = $conn->query($sql);
                if ($result) {
                    echo json_encode(array("statusCode" => 200));
                } else {
                    echo json_encode(array("statusCode" => 500, "error" => "Error: " . $sql . "\n" . $conn->error));
                }
            }else{
                $nomProd = $_POST['nomProd1'];
                $prixU = $_POST['prixU1'];
                $idCategorie = $_POST['categorie1'];
                $dateAjout = date('Y-m-d');
                $dateModif = date('Y-m-d');
                $etat = "active";

                $sql = "INSERT INTO produit (nomProd, prixU, idCategorie,dateAjout,dateModif,idU, etat) 
                VALUES ('$nomProd', $prixU, $idCategorie,'$dateAjout','$dateModif',$idU,'$etat')";
                // var_dump($sql);
                $result = $conn->query($sql);
                if ($result) {
                    echo json_encode(array("statusCode" => 200));
                } else {
                    echo json_encode(array("statusCode" => 500, "error" => "Error: " . $sql . "\n" . $conn->error));
                }
            }
        }
    }
?>