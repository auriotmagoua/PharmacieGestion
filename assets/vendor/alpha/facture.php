<?php
// echo 'salut';
require('alphapdf.php');

include '../../../connexiondb.php';

$conn = connexionMysqli();
if ($_SERVER["REQUEST_METHOD"] === "POST") {
if(isset($_POST['IDfact'])){
$numFact = $_POST['IDfact'];

$query = "SELECT nomClient, villeClient, emailClient, telephoneClient, dateVente, nomProd, qteVente, prixU, numFact FROM produit JOIN ventes ON produit.idProd = ventes.idProd JOIN client ON ventes.idClient = client.idClient WHERE ventes.numFact = '$numFact' AND ventes.idClient = client.idClient";
$result = $conn->query($query);

// Vérifier si des enregistrements ont été trouvés
if ($result !== false && $result->num_rows > 0) {
    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    } 


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
        $this->Cell( 0, 0, $this->data[0]['numFact'], 0, 1, 'R');
        $this->Ln();
        $this->SetXY(120, 47);
        $this->SetFont('Arial','B',14);
        $this->Cell(90, 0, 'Date de facturation:', 0, 1, 'L');
        $this->SetFont('Arial','I',14);
        if (!empty($this->data)) {
            $this->Cell(0, 0, $this->data[0]['dateVente'], 0, 1, 'R');
        }
        $this->SetXY(120, 54);
        $this->SetFont('Arial','B',14);
        $this->Cell(90, 0, utf8_decode('Échéance:'), 0, 1, 'L');
        $this->SetFont('Arial','I',14);
        if (!empty($this->data)) {
            $this->Cell(0, 0, $this->data[0]['dateVente'], 0, 1, 'R');
        }
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

}

$pdf = new CustomPDF($data); // Création d'une instance de la classe CustomPDF
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
$pdf->Cell(80, 7, utf8_decode($data[0]['nomClient']), 0, 1, 'L'); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Ville: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(95, 7, utf8_decode($data[0]['villeClient']), 0, 1, 'L'); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Email: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(95, 7, utf8_decode($data[0]['emailClient']), 0, 1, 'L'); 
$pdf->SetFont('Arial', 'B', 14); 
$pdf->Cell(30, 7, 'Telephone: ', 0, 0, 'L'); 
$pdf->SetFont('Arial', '', 14); 
$pdf->Cell(95, 7, utf8_decode($data[0]['telephoneClient']), 0, 1, 'L'); 
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
$w = array(15, 85, 25, 30, 35);
for ($i = 0; $i < count($header); $i++) {
    $pdf->Cell($w[$i], 8, $header[$i], 1, 0, 'C', true);
}
$pdf->Ln();

// Restauration des couleurs et de la police
$pdf->SetFillColor(224, 235, 255);
$pdf->SetTextColor(0);
$pdf->SetFont('');

$n = 1;
$montantHT = 0;
// Données du tableau
foreach ($data as $row) {
    $pdf->Cell($w[0],7,$n,'LRT',0,'C');
    $pdf->Cell($w[1],7,utf8_decode($row['nomProd']),'LRT',0,'L');
    $pdf->Cell($w[2],7,utf8_decode($row['qteVente']),'LRT',0,'R');
    $pdf->Cell($w[3],7,utf8_decode($row['prixU']),'LRT',0,'R');
    $montant = $row['qteVente'] * $row['prixU'];
    $pdf->Cell($w[4], 7, utf8_decode($montant), 'LRT', 0, 'R');
    $montantHT += $montant;
    $pdf->Ln();
    $n++;
}
// $row[0];

// Trait de fermeture
$pdf->Cell(array_sum($w), 0, '', 'T');

$pdf->Ln(); 
// $pdf->Cell(115);  // Cellule vide pour déplacer vers la droite
// $pdf->Cell(40, 7, 'Montant HT: ', 'LRT', 0, 'L'); 
// $pdf->Cell(35, 7, $montantHT, 'LRT', 1, 'R'); 

// $montantTVA = $montantHT * (19.25 / 100);
// $pdf->Cell(115);  // Cellule vide pour déplacer vers la droite
// $pdf->Cell(40, 7, 'TVA (19,25%): ', 'LRT', 0, 'L'); 
// $pdf->Cell(35, 7, $montantTVA, 'LRT', 1, 'R');

// $montantTotal = $montantHT + $montantTVA;
$pdf->SetTextColor(255);
$pdf->SetLineWidth(.3);
$pdf->SetFont('', 'B');
$pdf->SetFillColor(0, 100, 0); 
// $pdf->Cell(115);  // Cellule vide pour déplacer vers la droite
$pdf->Cell(155, 8, 'TOTAL: ', 'LRTB', 0, 'L', true); 
$pdf->Cell(35, 8, $montantHT, 'LRTB', 1, 'R', true); 
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
$pdf->Image('../../img/cachet.png',$pdf->GetX() + 110, $pdf->GetY() - 3, 40, 0);

}

$conn->close();
}
// Ne pas envoyer de sortie HTML avant la génération du PDF
$pdfOutput = $pdf->Output('', 'S'); // Stocker le PDF dans une variable

// Envoyer le PDF en réponse à la requête AJAX
echo base64_encode($pdfOutput);
exit; // Arrêter l'exécution du script PHP après l'envoi du PDF
}

?>