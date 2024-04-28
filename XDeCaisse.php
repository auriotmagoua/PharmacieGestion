<?php

require('assets/vendor/fpdf186/fpdf.php');

include 'connexiondb.php';

$conn = connexionMysqli();


// $query = "SELECT dateVente, qteVente FROM ventes WHERE ventes.numFact = 'CM-ICAB-2024-CDRI-1327'";
// $result = $conn->query($query);

// // Vérifier si des enregistrements ont été trouvés
// if ($result !== false && $result->num_rows > 0) {
//     $data = array();
//     while ($row = $result->fetch_assoc()) {
//         $data[] = $row;
//     } 
// }

$data = array();

class PDF extends FPDF
{
   // Chargement des donn�es
function LoadData($conn)
{
	$query = "SELECT dateVente, qteVente FROM ventes WHERE ventes.numFact = 'FACT-1335'";
    $result = $conn->query($query);

    // Vérifier si des enregistrements ont été trouvés
    if ($result !== false && $result->num_rows > 0) {
        // $data = array();
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        } 
    }
	return $data;
}

// Tableau color�
function FancyTable($data)
{
	
    $w = array(35, 10, 20, 20);

    // Ligne de séparation
    $this->SetLineWidth(0.5);
    $this->Line(10, $this->GetY() + 8, 95, $this->GetY() + 8);
    $this->Ln();

    $this->SetFont('Arial', '',10);
    // $montantHT = 0;
    // Données du tableau
    foreach ($data as $row) {
        $this->Cell($w[0],7,utf8_decode($row['dateVente']), 0,0,'L');
        $this->Cell($w[1],7,utf8_decode($row['qteVente']), 0,0,'R');
        $this->Cell($w[2],7,utf8_decode($row['qteVente']), 0,0,'R');
        // $montant = $row['qteVente'] * $row['prixU'];
        $this->Cell($w[3], 7, utf8_decode($row['qteVente']), 0, 0, 'R');
        // $montantHT += $montant;
        $this->Ln();
    }

    // // Ligne de séparation
    // $pdf->SetLineWidth(0.5);
    // $pdf->Line(10, $pdf->GetY() + 0, 95, $pdf->GetY() + 0);
    // $pdf->Ln();

    $this->SetFont('Arial', 'B',14);
    $this->Cell(50, 8, 'TOTAL: ', 'BLT', 0, 'L'); 
    $this->Cell(35, 8, 'montant', 'BTR', 1, 'R'); 

}

    // En-t�te
    function Header()
    {
        // Affichage du logo
        $this->Image('assets/img/pharma.jpeg',0, $this->GetY() - 8, 20, 0);

        // Positionnement du nom de l'entreprise
        $this->SetFont('Arial', 'B', 12);
        $this->SetXY(15, 8); // Ajustez les coordonnées x et y selon vos besoins
        $this->Cell(0, 10, 'PHARMACIE', 0, 1, 'L');
        // Adresse de la pharmacie
        $this->SetFont('Arial', '', 10);
        $this->SetXY(15, 18);
        $this->Cell(0, 5, 'nom de l\'utilisateur', 0, 1, 'L');
        $this->SetXY(15, 23);
        $this->Cell(0, 5, 'login', 0, 1, 'L');

        // Date et heure
        $this->SetXY(15, 28);
        $this->Cell(0, 5, 'date', 0, 1, 'L');
        // Saut de ligne
        $this->Ln();

        // Couleurs, épaisseur du trait et police en gras
        $this->SetLineWidth(.3);
        $this->SetFont('', 'B');
        // En-tête du tableau
        $header = array(utf8_decode('Désignation'), utf8_decode('Quantité'),  'Prix', 'Montant');
        // En-tête du tableau
        $w = array(35, 10, 20, 20);
        for ($i = 0; $i < count($header); $i++) {
            $this->Cell($w[$i], 8, $header[$i], 0, 0, 'C');
        }
        // $this->Ln();
    }

    // Pied de page
    function Footer()
    {
        // Positionnement � 1,5 cm du bas
        $this->SetY(-15);
        // Police Arial italique 8
        $this->SetFont('Arial','I',8);
       // Message de remerciement
        $this->SetFont('Arial', '', 10);
        $this->Cell(0, 5, utf8_decode('---- Merci et à Bientôt ----'), 0, 1, 'C');
    }
}

// Création d'un nouveau document PDF
$pdf = new PDF('P', 'mm', array(105, 148));
// $pdf = new PDF('P', 'pt', array(105, 148));
$pdf->AddPage(); // Ajout d'une page

// Définir les propriétés du document
$pdf->SetTitle('X de caisse pharmacie');
// $pdf->SetAuthor('Agoe Assiyeye');
// $pdf->SetCreator('FPDF');

// Charger les données à partir de la base de données
$data = $pdf->LoadData($conn);

$pdf->FancyTable($data);
// echo $data[0];
// // Couleurs, épaisseur du trait et police en gras
// $pdf->SetLineWidth(.3);
// $pdf->SetFont('', 'B');

// // En-tête du tableau
// $w = array(35, 10, 20, 20);
// for ($i = 0; $i < count($header); $i++) {
//     $pdf->Cell($w[$i], 8, $header[$i], 0, 0, 'C');
// }

// // Ligne de séparation
// $pdf->SetLineWidth(0.5);
// $pdf->Line(10, $pdf->GetY() + 8, 95, $pdf->GetY() + 8);
// $pdf->Ln();

// $pdf->SetFont('Arial', '',10);
// // $montantHT = 0;
// // Données du tableau
// foreach ($data as $row) {
//     $pdf->Cell($w[0],7,utf8_decode($row['dateVente']), 0,0,'L');
//     $pdf->Cell($w[1],7,utf8_decode($row['qteVente']), 0,0,'R');
//     $pdf->Cell($w[2],7,utf8_decode($row['qteVente']), 0,0,'R');
//     // $montant = $row['qteVente'] * $row['prixU'];
//     $pdf->Cell($w[3], 7, utf8_decode($row['qteVente']), 0, 0, 'R');
//     // $montantHT += $montant;
//     $pdf->Ln();
// }

// // // Ligne de séparation
// // $pdf->SetLineWidth(0.5);
// // $pdf->Line(10, $pdf->GetY() + 0, 95, $pdf->GetY() + 0);
// // $pdf->Ln();

// $pdf->SetFont('Arial', 'B',14);
// $pdf->Cell(50, 8, 'TOTAL: ', 'BLT', 0, 'L'); 
// $pdf->Cell(35, 8, 'montant', 'BTR', 1, 'R'); 


// Sortie du document PDF
$pdf->Output('recu.pdf', 'I');

?>