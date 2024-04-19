<?php
// require_once('assets/vendor/fpdf186/fpdf.php');

// class PDF extends FPDF
// {
//     // En-t�te
//     function Header()
//     {
//         // Logo
//         // $this->Image('assets/img/pharma.jpeg', 0, 0, $this->GetPageWidth(), $this->GetPageHeight());
//         // $this->SetAlpha(0.5); // Définit la transparence de l'image (0.5 = 50% de transparence)
//         $this->Image('assets/img/pharma.jpeg',0,0,0);
//         // Police Arial gras 15
//         $this->SetFont('Arial','B',12);
//         // D�calage � droite
//         $this->Cell(80);
//         // Titre
//         // $this->Cell(30,10,'Titre',1,0,'C');
//         $this->SetFont('Arial','B',40);
//         $this->SetTextColor(0, 100, 0);
//         $this->Cell(90, 30, 'FACTURE', 0, 1, 'R'); 
//         $this->Ln();
//         $this->SetXY(130, 40);
//         $this->SetFont('Arial','',12);
//         $this->SetTextColor(0, 0, 0);
//         $this->SetFont('Arial','B',12);
//         $this->Cell(90, 0, 'numero de facture:', 0, 1, 'L');
//         $this->SetFont('Arial','I',12);
//         $this->Cell( 0, 0, 'id-90', 0, 1, 'R');
//         $this->Ln();
//         $this->SetXY(130, 47);
//         $this->SetFont('Arial','B',12);
//         $this->Cell(90, 0, 'Date de facturation:', 0, 1, 'L');
//         $this->SetFont('Arial','I',12);
//         $this->Cell(0, 0, '12-12-2024', 0, 1, 'R');
//         $this->SetXY(130, 54);
//         $this->SetFont('Arial','B',12);
//         $this->Cell(90, 0, 'Echeance:', 0, 1, 'L');
//         $this->SetFont('Arial','I',12);
//         $this->Cell(0, 0, '12-12-2024', 0, 1, 'R');
//         // Saut de ligne
//         $this->Ln(20);
//     }

//     // Pied de page
//     function Footer()
//     {
//         // Positionnement � 1,5 cm du bas
//         $this->SetY(-15);
//         // Police Arial italique 8
//         $this->SetFont('Arial','I',8);
//         // Num�ro de page
//         $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
//     }
// }

// // Instanciation de la classe d�riv�e
// $pdf = new PDF();
// $pdf->AliasNbPages();
// $pdf->AddPage();
// $pdf->SetFont('Arial','B',20);
// // $pdf->SetXY(0, 100);
// $pdf->SetTextColor(0, 100, 0);
// $pdf->Cell(0, 0, utf8_decode('Facturé à:'), 0, 1, 'L'); 
// // RVB (rouge, vert, bleu)
// $pdf->SetTextColor(0, 100, 0);
// $pdf->Cell(0,0,utf8_decode('Envoyer à:'),0,1, 'R ');
// $pdf->Output();
?>


<?php
// require('assets/vendor/fpdf186/fpdf.php');

// // Create a new PDF object
// $pdf = new FPDF('P', 'mm', 'A4');

// // Add a new page
// $pdf->AddPage();

// // Set the font
// $pdf->SetFont('Arial', 'B', 16);

// // Add the invoice title
// $pdf->Cell(190, 10, 'FACTURE', 1, 0, 'C');

// // Set the font
// $pdf->SetFont('Arial', 'B', 12);

// // Add the invoice number and date
// $pdf->Cell(95, 6, 'Numéro de facture:', 0, 0, 'L');
// $pdf->Cell(95, 6, 'id-205', 0, 0, 'R');
// $pdf->Ln();
// $pdf->Cell(95, 6, 'Date de facturation:', 0, 0, 'L');
// $pdf->Cell(95, 6, '14/09/2023', 0, 0, 'R');
// $pdf->Ln();
// $pdf->Cell(95, 6, 'Echéance:', 0, 0, 'L');
// $pdf->Cell(95, 6, '14/10/2020', 0, 0, 'R');
// $pdf->Ln();

// // Add a blank line
// $pdf->Ln();

// // Set the font
// $pdf->SetFont('Arial', 'B', 10);

// // Add the customer information
// $pdf->Cell(95, 6, 'Facturé à', 1, 0, 'L');
// $pdf->Cell(95, 6, 'Envoyé à', 1, 0, 'R');
// $pdf->Ln();
// $pdf->Cell(95, 6, 'Jhon doe', 1, 0, 'L');
// $pdf->Cell(95, 6, 'Jhon doe', 1, 0, 'R');
// $pdf->Ln();
// $pdf->Cell(95, 6, 'adresse xxxxxxXXXXXXXXXXXXXXX', 1, 0, 'L');
// $pdf->Cell(95, 6, 'adresse xxxxx', 1, 0, 'R');

// // Add a blank line
// $pdf->Ln();

// // Add the table header
// $pdf->SetFillColor(230, 230, 230);
// $pdf->Cell(25, 6, 'QTE', 1, 0, 'C', true);
// $pdf->Cell(100, 6, 'DESIGNATION', 1, 0, 'L', true);
// $pdf->Cell(30, 6, 'PRIX UNIT', 1, 0, 'R', true);
// $pdf->Cell(30, 6, 'MONTANT', 1, 0, 'R', true);
// $pdf->Ln();

// // Add the table body
// $pdf->SetFont('Arial', '', 10);
// $pdf->SetFillColor(255, 255, 255);
// $pdf->Cell(25, 6, '9', 1, 0, 'C');
// $pdf->Cell(100, 6, 'Article', 1, 0, 'L');
// $pdf->Cell(30, 6, '350,00', 1, 0, 'R');
// $pdf->Cell(30, 6, '3 150,00', 1, 0, 'R');
// $pdf->Ln();
// $pdf->Cell(25, 6, '7', 1, 0, 'C');
// $pdf->Cell(100, 6, 'Article', 1, 0, 'L');
// $pdf->Cell(30, 6, '120,00', 1, 0, 'R');
// $pdf->Cell(30, 6, '840,00', 1, 0, 'R');
// $pdf->Ln();
// $pdf->Cell(25, 6, '8', 1, 0, 'C');
// $pdf->Cell(100, 6, 'Article', 1, 0, 'L');
// // Replace with your logic to calculate subtotal
// // $subtotal = 3150 + 840 + (...);  // Add more line items if needed

// $pdf->Ln(); // Add a blank line

// $pdf->SetFont('Arial', 'B', 12);

// // Display subtotal
// $pdf->Cell(155, 6, 'Sous-total:', 0, 0, 'R');
// // $pdf->Cell(30, 6, number_format($subtotal, 2, ',', ' '), 0, 0, 'R');
// $pdf->Ln();

// // Replace with your logic to calculate total (including tax)
// // $total = $subtotal + (...);

// // Display total
// $pdf->Cell(155, 6, 'Total:', 0, 0, 'R');
// // $pdf->Cell(30, 6, number_format($total, 2, ',', ' '), 0, 0, 'R');
// // Add company logo (replace with your logo path)
// $logo_path = 'assets/img/pharma.jpeg';
// $pdf->Image($logo_path, 10, 6, 30);  // Adjust X and Y coordinates as needed

// // Add company address
// $pdf->SetFont('Arial', 'B', 10);
// $pdf->Ln();
// $pdf->Cell(190, 6, 'Votre société', 0, 0, 'C');
// $pdf->Ln();
// $pdf->SetFont('Arial', '', 10);
// $pdf->Cell(190, 6, 'Adresse de la société', 0, 0, 'C');

// // Add payment information (replace with your details)
// $pdf->Ln();
// $pdf->Cell(190, 6, 'IBAN: FR76...', 0, 0, 'C');
// $pdf->Ln();
// $pdf->Cell(190, 6, 'BIC:...', 0, 0, 'C');

// // Add terms and conditions (replace with your terms)
// $pdf->Ln();
// $pdf->SetFont('Arial', '', 8);
// $pdf->Cell(190, 6, 'Conditions générales de vente au verso.', 0, 0, 'C');
// // $pdf->Output('invoice.pdf', 'F');  // Saves the PDF as 'invoice.pdf'
// $pdf->Output();  // Saves the PDF as 'invoice.pdf'

?>

<?php
require('assets/vendor/fpdf186/fpdf.php');

// Créer un nouvel objet PDF
class CustomPDF extends FPDF
{
    // Fonction d'en-tête
    function Header()
    {
        // Logo (à remplacer par le chemin de votre logo)
        $this->Image('assets/img/pharma.jpeg',0,0,0);

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

        $n = 0;
        // Données du tableau
        foreach ($data as $row) {
            $this->Cell($w[0],7,$n+1,'LRT',0,'C');
            $this->Cell($w[1],7,$row[1],'LRT',0,'L');
            $this->Cell($w[2],7,$row[2],'LRT',0,'R');
            $this->Cell($w[3],7,$row[3],'LRT',0,'R');
            $this->Cell($w[4],7,$row[4],'LRT',0,'R');
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
$pdf->Cell(80, 7, 'Jhon Doe', 0, 1, 'L'); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Ville: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(95, 7, 'Bafoussam', 0, 1, 'L'); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Email: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(95, 7, 'adresse@gmial.com', 0, 1, 'L'); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Telephone: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(95, 7, '698989898', 0, 1, 'L'); 
$pdf->Ln(10); 

// En-tête du tableau
$header = array('n', 'Description', utf8_decode('Quantité'),  'Prix unitaire', 'Montant');
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