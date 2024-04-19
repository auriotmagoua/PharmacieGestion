<?php
require('alphapdf.php');

// Créer un nouvel objet PDF
class CustomPDF extends AlphaPDF
{
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
        $this->Cell( 0, 0, 'id-90', 0, 1, 'R');
        $this->Ln();
        $this->SetXY(120, 47);
        $this->SetFont('Arial','B',14);
        $this->Cell(90, 0, 'Date de facturation:', 0, 1, 'L');
        $this->SetFont('Arial','I',14);
        $this->Cell(0, 0, '12-12-2024', 0, 1, 'R');
        $this->SetXY(120, 54);
        $this->SetFont('Arial','B',14);
        $this->Cell(90, 0, utf8_decode('Échéance:'), 0, 1, 'L');
        $this->SetFont('Arial','I',14);
        $this->Cell(0, 0, '12-12-2024', 0, 1, 'R');
        $this->Ln(20);
    }

    // Fonction de pied de page
    function Footer()
    {
        // Position à 15 mm du bas
        $this->SetY(-15);

        // Texte du pied de page
        $this->SetFont('Arial', 'I', 14);
        $this->Cell(0, 10, 'Merci d\'etre passe chez nous', 0, 0, 'C');
    }

    // Chargement des données
    function LoadData()
    {
        // Ajouter le corps du tableau
        $data = array(
            array('', 'Article 1', '9', '350,00', '3 150,00'),
            array('', 'Article 1', '9', '350,00', '3 150,00'),
            array('', 'Article 1', '9', '350,00', '3 150,00'),
            array('', 'Article 1', '9', '350,00', '3 150,00'),
            array('', 'Article 1', '9', '350,00', '3 150,00'),
            array('', 'Article 2', '7', '120,00', '840,00'),
            array('', 'Article 2', '7', '120,00', '840,00'),
            array('', 'Article 2', '7', '120,00', '840,00'),
            array('', 'Article 2', '7', '120,00', '840,00'),
            array('', 'Article 2', '7', '120,00', '840,00'),
            array('', 'Article 2', '7', '120,00', '840,00'),
            array('', 'Article 2', '7', '120,00', '840,00')
            // ...
        );
        return $data;
    }

    // Tableau personnalisé
    function FancyTable($header, $data)
    {
        // Couleurs, épaisseur du trait et police en gras
        $this->SetFillColor(0, 100, 0); 
        $this->SetTextColor(255);
        // $this->SetDrawColor(128, 0, 0);
        $this->SetLineWidth(.3);
        $this->SetFont('', 'B');

        // En-tête du tableau
        $w = array(25, 75, 25, 30, 35);
        for ($i = 0; $i < count($header); $i++) {
            $this->Cell($w[$i], 8, $header[$i], 1, 0, 'C', true);
        }
        $this->Ln();

        // Restauration des couleurs et de la police
        $this->SetFillColor(224, 235, 255);
        $this->SetTextColor(0);
        $this->SetFont('');

        $n = 1;
        // Données du tableau
        foreach ($data as $row) {
            $this->Cell($w[0],7,$n,'LRT',0,'C');
            $this->Cell($w[1],7,utf8_decode($row[1]),'LRT',0,'L');
            $this->Cell($w[2],7,utf8_decode($row[2]),'LRT',0,'R');
            $this->Cell($w[3],7,utf8_decode($row[3]),'LRT',0,'R');
            $this->Cell($w[4],7,utf8_decode($row[4]),'LRT',0,'R');
            $this->Ln();
            $n++;
        }

        // Trait de fermeture
        $this->Cell(array_sum($w), 0, '', 'T');
    }
}

$pdf = new CustomPDF(); // Création d'une instance de la classe CustomPDF
$pdf->AliasNbPages(); // Gestion automatique du nombre de pages

$pdf->AddPage(); // Ajout d'une page

// Données du client
$pdf->SetFont('Arial','B',20); 
$pdf->SetTextColor(0, 100, 0); 
$pdf->Cell(95, 10, utf8_decode('Facturé à:'), 0, 1, 'L'); 
$pdf->SetTextColor(0, 0, 0); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Nom: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(80, 7, utf8_decode('Jhon Doe'), 0, 1, 'L'); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Ville: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(95, 7, utf8_decode('Bafoussam'), 0, 1, 'L'); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Email: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(95, 7, utf8_decode('adresse@gmial.com'), 0, 1, 'L'); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Telephone: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(95, 7, utf8_decode('698989898'), 0, 1, 'L'); 
$pdf->Ln(10); 

// En-tête du tableau
$header = array('n', utf8_decode('Désignation'), utf8_decode('Quantité'),  'Prix unitaire', 'Montant');
$pdf->SetFont('Arial', 'B', 14);
$pdf->FancyTable($header, $pdf->LoadData());
$pdf->Ln(); 
$pdf->Cell(115);  // Cellule vide pour déplacer vers la droite
$pdf->Cell(40, 7, 'Montant HT: ', 'LRT', 0, 'L'); 
$pdf->Cell(35, 7, '234456', 'LRT', 1, 'R'); 

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

$pdf->Output(); // Génération du document PDF
?>