<?php
require_once('assets/vendor/fpdf186/fpdf.php');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Connexion à la base de données
    include 'connexiondb.php';

    $conn = connexionMysqli();

    // Récupération des valeurs du formulaire
    $date1 = $conn->real_escape_string($_POST['dateD']);
    $date2 = $conn->real_escape_string($_POST['dateF']);
    $etat = $conn->real_escape_string($_POST['etatP']);

    class PDF extends FPDF
    {
        // Tableau simple
        function BasicTable($header, $data)
        {
            // En-tête
            foreach ($header as $col) {
                $this->Cell(40, 7, $col, 1);
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
    $header = array('IdVente', 'DateVente', 'QteVente', 'PrixT', 'NomProd', 'NomClient');

    // Requête pour récupérer les données de la table produit
    $sql = "SELECT 
                ventes.idVente, 
                ventes.dateVente, 
                ventes.qteVente, 
                ventes.prixT, 
                produit.nomProd, 
                client.nomClient
            FROM 
                ventes
            JOIN 
                produit ON ventes.idProd = produit.idProd
            JOIN 
                client ON ventes.idClient = client.idClient 
            WHERE 
                DATE(ventes.dateVente) BETWEEN '$date1' AND '$date2'
                AND ventes.etat = '$etat';";

    $result = $conn->query($sql);

    $data = array();
    if ($result->num_rows > 0) {
        // Récupérer chaque ligne de données
        while ($row = $result->fetch_assoc()) {
            $data[] = array($row["idVente"], $row["dateVente"], $row["qteVente"], $row["prixT"], $row["nomProd"], $row["nomClient"]);
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
