
<?php
require_once('alphapdf.php');
require_once '../../connexionBD.php'; 
$con = connexionMsqli();


class MyPDF extends Alphapdf{

    function Header()
    {
        
        $this->SetFont('Arial','B',30);
        // Décalage à droite
        $this->Cell(120);
        // Titre
        $this->Cell(150,15,'LISTE DES PRODUITS',1,2,'C');
        // Saut de ligne
        $this->Ln(15);
        $this->SetAlpha(0.25);
        $this->Image('lena.jpg', 0, 0, $this->GetPageWidth(), $this->GetPageHeight());
        $this->SetAlpha(1);
    
    }
}
$pdf = new MyPDF('L', 'mm', 'A3');
$pdf->AddPage();


  
$pdf->AliasNbPages();
$header = array('Id', 'Code', 'Nom', 'Description', 'Poids', 'PrixU', 'PrixV', 'DateAjout', 'DateModif');
// $data = $pdf->LoadData();
$pdf->SetFont('Arial','',14);
// $pdf->AddPage();
// $pdf->FancyTable($header,$data);

// Requête pour récupérer les données de la table "produit"
$query = "SELECT * FROM produit LIMIT 100";
$result = $con->query($query);

$data = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = array(
            $row['idProd'],
            $row['codeProd'],
            $row['nomProd'],
            $row['description'],
            $row['image'],
            $row['poid'],
            $row['prixU'],
            $row['prixV'],
            $row['dateAjout'],
            $row['dateModif'],
            $row['idUser']
        );
    }
}

$con->close();

$pdf->SetFillColor(255,0,0);
$pdf->SetTextColor(255);
$pdf->SetDrawColor(128,0,0);
$pdf->SetLineWidth(.3);
$pdf->SetFont('','B');
// En-t�te
$w = array(15, 25, 40, 170, 20, 15, 15, 50, 50);
for($i=0;$i<count($header);$i++)
    $pdf->Cell($w[$i],7,$header[$i],1,0,'C',true);
$pdf->Ln();
// Restauration des couleurs et de la police
$pdf->SetFillColor(224,235,255);
$pdf->SetTextColor(0);
$pdf->SetFont('');
// Donn�es
$fill = false;
foreach($data as $row)
{
    // $pdf->AddPage();
    $pdf->Cell($w[0],6,$row[0],'LR',0,'L',$fill);
    $pdf->Cell($w[1],6,$row[1],'LR',0,'L',$fill);
    $pdf->Cell($w[2],6,$row[2],'LR',0,'L',$fill);
    $pdf->Cell($w[3],6,$row[3],'LR',0,'L',$fill);
    // $this->Cell($w[4],6,$row[4],'LR',0,'L',$fill);
    $pdf->Cell($w[4],6,$row[5],'LR',0,'L',$fill);
    $pdf->Cell($w[5],6,$row[6],'LR',0,'R',$fill);
    $pdf->Cell($w[6],6,$row[7],'LR',0,'R',$fill);
    $pdf->Cell($w[7],6,$row[8],'LR',0,'L',$fill);
    $pdf->Cell($w[8],6,$row[9],'LR',0,'L',$fill);
    // $this->Cell($w[10],6,$row[10],'LR',0,'L',$fill);
    $pdf->Ln();
    $fill = !$fill;
    // addWatermark($pdf);

}
	// Trait de terminaison
	$pdf->Cell(array_sum($w),0,'','T');

// return $data;
// $pdf->SetFont('Arial', '', 12);
// $pdf->Text(46,68,'Lena est une mangeuse');
$pdf->Output();

?>
