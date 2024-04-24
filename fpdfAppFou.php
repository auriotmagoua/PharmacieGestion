<?php
require_once('assets/vendor/fpdf186/fpdf.php');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Connexion à la base de données
    include 'connexiondb.php';

    $conn = connexionMysqli();

    // Récupération des valeurs du formulaire
    $date1 = $conn->real_escape_string($_POST['dateD']);
    $date2 = $conn->real_escape_string($_POST['dateF']);
    $idfour = $conn->real_escape_string($_POST['select-autocomplete']);

    
    class PDF extends FPDF
    {
        // Tableau simple
        function BasicTable($header, $data)
        {
            // En-tête
            foreach ($header as $col) {
                $this->Cell(40, 8, $col, 1);
            }
            $this->Ln();

            // Données
            foreach ($data as $row) {
                foreach ($row as $col) {
                    $this->Cell(40, 6, $col, 1);
                }
                $this->Ln();
            }
        }
    }

    $pdf = new PDF('L'); // 'L' indique l'orientation paysage
    $pdf->SetFont('Arial', '', 12); // Réduire la taille de la police
    $pdf->AddPage();

    // Titres des colonnes
    $header = array('Id Approv',  'Qte Approv', 'date Approv', 'prixU', 'Nom Prod','Nom Four');

    // Requête pour récupérer les données de la table produit
    $sql = "SELECT 
                approvisionnement.idAppro, 
                approvisionnement.qteAppro, 
                approvisionnement.dateAppro,  
                approvisionnement.prixU,  
                produit.nomProd, 
                fournisseur.nomFournis
            FROM 
                approvisionnement
            JOIN 
                produit ON approvisionnement.idProd = produit.idProd
            JOIN 
                fournisseur ON approvisionnement.idFournis = fournisseur.idFournis 
            WHERE 
                DATE(approvisionnement.dateAppro) BETWEEN '$date1' AND '$date2'
                AND approvisionnement.idFournis = '$idfour';";

    $result = $conn->query($sql);

    $data = array();
    if ($result->num_rows > 0) {
        // Récupérer chaque ligne de données
        while ($row = $result->fetch_assoc()) {
            $data[] = array($row["idAppro"], $row["qteAppro"], $row["dateAppro"], $row["prixU"], $row["nomProd"], $row["nomFournis"]);
        }
    } else {
        echo "0 results";
    }

    $conn->close();

    $pdf->BasicTable($header, $data);

    // Ne pas envoyer de sortie HTML avant la génération du PDF
    $pdfOutput = $pdf->Output('', 'S'); // Stocker le PDF dans une variable

    // Envoyer le PDF en réponse à la requête AJAX
    echo base64_encode($pdfOutput);
    exit; // Arrêter l'exécution du script PHP après l'envoi du PDF
}
?>
