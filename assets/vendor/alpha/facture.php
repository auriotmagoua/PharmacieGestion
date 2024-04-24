<?php
require('alphapdf.php');

include '../../../connexiondb.php';

$conn = connexionMysqli();

$query = "SELECT DISTINCT nomClient, villeClient, emailClient, telephoneClient, dateVente, nomProd, qteVente, prixU FROM produit JOIN ventes ON produit.idProd = ventes.idProd JOIN client ON ventes.idClient = client.idClient WHERE ventes.numFact = '73462' AND ventes.idClient = 2";

        $result = $conn->query($query);

        $data = array();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $data[] = array(
                    $row['nomClient'],
                    $row['villeClient'],
                    $row['emailClient'],
                    $row['telephoneClient'],
                    $row['dateVente'],
                    $row['nomProd'],
                    $row['qteVente'],
                    $row['prixU'],
                );
            }
        }

        $conn->close();
// Créer un nouvel objet PDF
class CustomPDF extends AlphaPDF
{
    private $data; // Nouvelle variable pour stocker les données

    // Constructeur de la classe
    public function __construct($data)
    {
        parent::__construct();
        $this->data = $data; // Stocke les données passées en paramètre
    }
    // Fonction d'en-tête
    function Header()
    {
        // Logo (à remplacer par le chemin de votre logo)
        $this->Image('../../img/pharma.jpeg',0,0,0);

        $this->SetAlpha(0.20);
        $this->Image('../../img/pharma.jpeg', 0, 0, $this->GetPageWidth(), $this->GetPageHeight());
        $this->SetAlpha(1);
        // Adresse de l'entreprise
        $this->Cell(80);
        $this->SetFont('Arial','B',40);
        $this->SetTextColor(0, 100, 0);
        $this->Cell(90, 30, 'FACTURE', 0, 1, 'R'); 
        $this->Ln();
        $this->SetXY(120, 40);
        $this->SetFont('Arial','',14);
        $this->SetTextColor(0, 0, 0);
        $this->SetFont('Arial','B',14);
        $this->Cell(90, 0, utf8_decode('Numéro de facture:'), 0, 1, 'L');
        $this->SetFont('Arial','I',14);
        $this->Cell( 0, 0, '73462', 0, 1, 'R');
        $this->Ln();
        $this->SetXY(120, 47);
        $this->SetFont('Arial','B',14);
        $this->Cell(90, 0, 'Date de facturation:', 0, 1, 'L');
        $this->SetFont('Arial','I',14);
        if (!empty($this->data)) {
            $this->Cell(0, 0, $this->data[0][4], 0, 1, 'R');
        }
        $this->SetXY(120, 54);
        $this->SetFont('Arial','B',14);
        $this->Cell(90, 0, utf8_decode('Échéance:'), 0, 1, 'L');
        $this->SetFont('Arial','I',14);
        if (!empty($this->data)) {
            $this->Cell(0, 0, $this->data[0][4], 0, 1, 'R');
        }
        $this->Ln(20);
    }

//     // Fonction de pied de page
//     function Footer()
//     {
//         // Position à 15 mm du bas
//         $this->SetY(-15);

        // Texte du pied de page
        $this->SetFont('Arial', 'I', 14);
        $this->Cell(0, 10, 'Merci d\'etre passe chez nous', 0, 0, 'C');
    }

}

$pdf = new CustomPDF($data); // Création d'une instance de la classe CustomPDF
$pdf->AliasNbPages(); // Gestion automatique du nombre de pages

// $pdf->AddPage(); // Ajout d'une page

// Données du client
$pdf->SetFont('Arial','B',20); 
$pdf->SetTextColor(0, 100, 0); 
$pdf->Cell(95, 10, utf8_decode('Facturé à:'), 0, 1, 'L'); 
$pdf->SetTextColor(0, 0, 0); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Nom: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(80, 7, utf8_decode($data[0][0]), 0, 1, 'L'); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Ville: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(95, 7, utf8_decode($data[0][1]), 0, 1, 'L'); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Email: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(95, 7, utf8_decode($data[0][2]), 0, 1, 'L'); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Telephone: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(95, 7, utf8_decode($data[0][3]), 0, 1, 'L'); 
$pdf->Ln(10); 

// En-tête du tableau
$header = array('n', utf8_decode('Désignation'), utf8_decode('Quantité'),  'Prix unitaire', 'Montant');
$pdf->SetFont('Arial', 'B', 14);



// $pdf->FancyTable($header, $pdf->LoadData());

// Couleurs, épaisseur du trait et police en gras
$pdf->SetFillColor(0, 100, 0); 
$pdf->SetTextColor(255);
// $this->SetDrawColor(128, 0, 0);
$pdf->SetLineWidth(.3);
$pdf->SetFont('', 'B');

// En-tête du tableau
$w = array(25, 75, 25, 30, 35);
for ($i = 0; $i < count($header); $i++) {
    $pdf->Cell($w[$i], 8, $header[$i], 1, 0, 'C', true);
}
$pdf->Ln();

// Restauration des couleurs et de la police
$pdf->SetFillColor(224, 235, 255);
$pdf->SetTextColor(0);
$pdf->SetFont('');

$n = 1;
$montantTotal = 0;
// Données du tableau
foreach ($data as $row) {
    $pdf->Cell($w[0],7,$n,'LRT',0,'C');
    $pdf->Cell($w[1],7,utf8_decode($row[5]),'LRT',0,'L');
    $pdf->Cell($w[2],7,utf8_decode($row[6]),'LRT',0,'R');
    $pdf->Cell($w[3],7,utf8_decode($row[7]),'LRT',0,'R');
    $montant = $row[6] * $row[7];
    $pdf->Cell($w[4], 7, utf8_decode($montant), 'LRT', 0, 'R');
    $montantTotal += $montant;
    $pdf->Ln();
    $n++;
}
// $row[0];

// Trait de fermeture
$pdf->Cell(array_sum($w), 0, '', 'T');

$pdf->Ln(); 
$pdf->Cell(115);  // Cellule vide pour déplacer vers la droite
$pdf->Cell(40, 7, 'Montant HT: ', 'LRT', 0, 'L'); 
$pdf->Cell(35, 7, $montantTotal, 'LRT', 1, 'R'); 

$pdf->Cell(115);  // Cellule vide pour déplacer vers la droite
$pdf->Cell(40, 7, 'TVA (19,25%): ', 'LRT', 0, 'L'); 
$pdf->Cell(35, 7, '345.2', 'LRT', 1, 'R');

$pdf->SetTextColor(255);
$pdf->SetLineWidth(.3);
$pdf->SetFont('', 'B');
$pdf->SetFillColor(0, 100, 0); 
$pdf->Cell(115);  // Cellule vide pour déplacer vers la droite
$pdf->Cell(40, 8, 'TOTAL TTC: ', 'LRTB', 0, 'L', true); 
$pdf->Cell(35, 8, '987645', 'LRTB', 1, 'R', true); 
// Restauration des couleurs et de la police
$pdf->SetFillColor(224, 235, 255);
$pdf->SetTextColor(0);
$pdf->SetFont('');

$pdf->Ln(10);
$pdf->Cell(20);
$pdf->SetFont('', 'B');
$pdf->Cell(40, 8, 'Signature Client', 'B', 0, 'L'); 
$pdf->Cell(50);
$pdf->Cell(40, 8, 'Signature Caisse', 'B', 1, 'L'); 

// $pdf->Output(); // Génération du document PDF
?>