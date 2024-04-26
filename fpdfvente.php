<?php
require_once('assets/vendor/fpdf186/fpdf.php');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Connexion à la base de données
    include 'connexiondb.php';

    $conn = connexionMysqli();

    // Récupération des valeurs du formulaire
    $date1 = !empty($_POST['dateD']) ? $conn->real_escape_string($_POST['dateD']) : '';
    $date2 = !empty($_POST['dateF']) ? $conn->real_escape_string($_POST['dateF']) : '';
    $etat = !empty($_POST['etatP']) ? $conn->real_escape_string($_POST['etatP']) : '';
   

    class PDF extends FPDF
    {
        // Tableau simple
        function BasicTable($title, $header, $data)
        {
            // Encadrer le titre
            $this->SetFont('Arial', '', 20);
            $this->Cell(0, 10, $title, 1, 1, 'C');

            // Saut de ligne après le titre
            $this->Ln();

            // En-tête
            foreach ($header as $col) {
                $this->SetFont('Arial', 'B', 15); // Réduire la taille de la police

                $this->Cell(48, 9, $col, 1);
            }
            $this->Ln();

            // Données
            foreach ($data as $row) {
                foreach ($row as $col) {
                    // Ajuster la largeur de la cellule pour éviter le chevauchement
                    $this->SetFont('Arial', '', 10); // Réduire la taille de la police
                    $this->Cell(48, 9, $col, 1);
                }
                $this->Ln();
            }
        }
    }

    $pdf = new PDF('L'); // 'L' indique l'orientation paysage
    $pdf->SetFont('Arial', '', 10); // Réduire la taille de la police
    $pdf->AddPage();

    // Titres des colonnes
    $header = array('IdVente', 'DateVente', 'QteVente', 'Nom Fact', 'NomProd', 'NomClient');

    // Titre du tableau en fonction des critères de la requête
    $title = "Liste Medicament";
    if (!empty($date1) && !empty($date2) && !empty($etat)) {
        $title = "Liste entre $date1 et $date2 et $etat";
    } elseif (!empty($date1) && empty($date2) && !empty($etat)) {
        $title = "Liste pour la date $date1 et $etat";
    } elseif (empty($date1) && !empty($date2) && !empty($etat)) {
        $title = "Liste pour la date $date2 et $etat";
    } elseif (!empty($date1) && !empty($date2) && empty($etat)) {
        $title = "Liste entre $date1 et $date2";
    } elseif (!empty($date1) && empty($date2) && empty($etat)) {
        $title = "Liste pour la date $date1";
    } elseif (empty($date1) && !empty($date2) && empty($etat)) {
        $title = "Liste pour la date $date2";
    } elseif (empty($date1) && empty($date2) && !empty($etat)) {
        $title = "Liste de $etat";
    } elseif (empty($date1) && empty($date2) && empty($etat)) {
        $title = "Tous les Liste Medicament ";
    }

    // Requête pour récupérer les données de la table produit
      $sql = "SELECT 
                ventes.idVente, 
                ventes.dateVente, 
                ventes.qteVente, 
                ventes.numFact, 
                ventes.etat, 
                produit.nomProd, 
                client.nomClient
            FROM 
                 ventes
            JOIN 
                produit ON ventes.idProd = produit.idProd
            JOIN 
                client ON ventes.idClient = client.idClient";



    if (empty($date1) && empty($date2) && empty($etat)) {
        $sql .= " WHERE ventes.etat = 'active'";
    } elseif (!empty($date1) && empty($date2) && empty($etat)) {
        $sql .= " WHERE ventes.dateVente = '$date1'";
    } elseif (empty($date1) && !empty($date2) && empty($etat)) {
        $sql .= " WHERE ventes.dateVente = '$date2'";
    } elseif (empty($date1) && empty($date2) && !empty($etat)) {
        $sql .= " WHERE ventes.etat = '$etat'";
    } elseif (!empty($date1) && !empty($date2) && empty($etat)) {
        if ($date2 < $date1) {
            $temp = $date1;
            $date1 = $date2;
            $date2 = $temp;
        }
        $sql .= " WHERE DATE(ventes.dateVente) BETWEEN '$date1' AND '$date2'";
    } elseif (!empty($date1) && empty($date2) && !empty($etat)) {
        $sql .= " WHERE ventes.dateVente = '$date1' AND ventes.etat = '$etat'";
    } elseif (empty($date1) && !empty($date2) && !empty($etat)) {
        $sql .= " WHERE ventes.dateVente = '$date2' AND ventes.etat = '$etat'";
    } elseif (!empty($date1) && !empty($date2) && !empty($etat)) {
        if ($date2 < $date1) {
            $temp = $date1;
            $date1 = $date2;
            $date2 = $temp;
        }
        $sql .= " WHERE DATE(ventes.dateVente) BETWEEN '$date1' AND '$date2' AND ventes.etat = '$etat'";
    }

    $result = $conn->query($sql);

    $data = array();
    if ($result->num_rows > 0) {
        // Récupérer chaque ligne de données
        while ($row = $result->fetch_assoc()) {
            $data[] = array($row["idVente"], $row["dateVente"], $row["qteVente"], $row["numFact"], $row["nomProd"], $row["nomClient"]);
        }
    } else {
        echo "0 results";
    }

    $conn->close();

    $pdf->BasicTable($title, $header, $data);

    // Ne pas envoyer de sortie HTML avant la génération du PDF
    $pdfOutput = $pdf->Output('', 'S'); // Stocker le PDF dans une variable

    // Envoyer le PDF en réponse à la requête AJAX
    echo base64_encode($pdfOutput);
    exit; // Arrêter l'exécution du script PHP après l'envoi du PDF
}
?>
