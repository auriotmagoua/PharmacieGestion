
<?php
require_once('assets/vendor/fpdf186/fpdf.php');
require_once('tet.php');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Connexion à la base de données
    include 'connexiondb.php';

    $conn = connexionMysqli();

    // Récupération des valeurs du formulaire
    $date1 = !empty($_POST['dateD']) ? $conn->real_escape_string($_POST['dateD']) : '';
    $date2 = !empty($_POST['dateF']) ? $conn->real_escape_string($_POST['dateF']) : '';
    $iduser = !empty($_POST['select-autocomplete2']) ? $conn->real_escape_string($_POST['select-autocomplete2']) : '';

    if(empty( $iduser) ){
        $iduser = $idU;
    }

    $personne = '';
    // Préparer la requête SQL pour vérifier les identifiants
    $requete = $conn->prepare("SELECT * FROM user WHERE idU= ?  AND etat='active'");
    $requete->bind_param("s", $iduser);
    $requete->execute();
    $resultat = $requete->get_result();
    if ($resultat->num_rows === 1) {
        // Récupérer la ligne de résultat
        $row = $resultat->fetch_assoc();
    
        // Récupérer l'ID de l'utilisateur
        $personne = $row['nomU'];
    
    }

    class PDF extends FPDF
    {
        public $dateVente; // Déclarer la variable $dateVente comme globale
        public $nomU; // Déclarer la variable $dateVente comme globale

        // Méthode pour l'en-tête
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
        $this->Cell(0, 5, utf8_decode($this->nomU), 0, 1, 'L');

        // Date et heure
        $this->SetXY(15, 23);
        $this->Cell(0, 5, $this->dateVente, 0, 1, 'L');
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
        // Ligne de séparation
        $this->SetLineWidth(0.5);
        $this->Line(10, $this->GetY() + 8, 95, $this->GetY() + 8);
        $this->Ln();

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

        // Tableau simple
      // Tableau simple
      function FancyTable($data)
      {
        $w = array(35, 10, 20, 20);
    
        $this->SetFont('Arial', '',10);
        $montantHT = 0;
        // Données du tableau
        foreach ($data as $row) {
            $this->Cell($w[0],7,utf8_decode($row[5]), 0,0,'L');
            $this->Cell($w[1],7,utf8_decode($row[3]), 0,0,'R');
            $this->Cell($w[2],7,utf8_decode($row[2]), 0,0,'R');
            $montant = $row[3] * $row[2];
            $this->Cell($w[3], 7, utf8_decode($montant), 0, 0, 'R');
            $montantHT += $montant;
            
            $this->Ln();
        }
    
        // // Ligne de séparation
        // $pdf->SetLineWidth(0.5);
        // $pdf->Line(10, $pdf->GetY() + 0, 95, $pdf->GetY() + 0);
        // $pdf->Ln();
    
        $this->SetFont('Arial', 'B',14);
        $this->Cell(50, 8, 'TOTAL: ', 'BLT', 0, 'L'); 
        $this->Cell(35, 8, $montantHT, 'BTR', 1, 'R'); 
      }
  }

// Création d'un nouveau document PDF
$pdf = new PDF('P', 'mm', array(105, 148));
$pdf->SetFont('Arial', '', 10); // Réduire la taille de la police
    
    
    
    // Requête pour récupérer les données de la table produit
    $sql = "SELECT 
                ventes.idVente, 
                ventes.dateVente, 
                ventes.qteVente, 
                ventes.prixVente, 
                ventes.numFact, 
                ventes.etat, 
                ventes.idU, 
                produit.nomProd, 
                client.nomClient,
                user.nomU
        FROM 
            ventes
        JOIN 
            produit ON ventes.idProd = produit.idProd
        JOIN 
            user ON ventes.idU = user.idU
        JOIN 
            client ON ventes.idClient = client.idClient";

    if (empty($date1) && empty($date2) && !empty($iduser)) {
        $sql .= " WHERE ventes.dateVente = '" . date('Y-m-d') . "' AND ventes.idU = '$iduser'";
    } elseif (!empty($date1) && empty($date2) && !empty($iduser)) {
        $sql .= " WHERE ventes.dateVente = '$date1' AND ventes.idU = '$iduser'";
    } elseif (empty($date1) && !empty($date2) && !empty($iduser)) {
        $sql .= " WHERE ventes.dateVente = '$date2' AND ventes.idU = '$iduser'";
    } elseif (!empty($date1) && !empty($date2) && !empty($iduser)) {
        if ($date2 < $date1) {
            $temp = $date1;
            $date1 = $date2;
            $date2 = $temp;
        }
        $sql .= " WHERE DATE(ventes.dateVente) BETWEEN '$date1' AND '$date2' AND ventes.idU = '$iduser'";
    }

    $result = $conn->query($sql);

    // $data = array();
    // Vérifier si des enregistrements ont été trouvés
    $dateVente = 'date';
    $data = array();
    if ($result->num_rows > 0) {
        // Récupérer chaque ligne de données
        $i=1;
        while ($row = $result->fetch_assoc()) {
           
            $data[] = array( $i, $row["dateVente"], $row["qteVente"], $row["prixVente"], $row["numFact"], $row["nomProd"], $row["nomClient"], $row["nomU"]);

            $i++;
        }
        
    } else {
        echo "0 results";
    }
    // $dateVente = $data[0][1];
    // $pdf->dateVente = $dateVente;

    // Titre du tableau en fonction des critères de la requête
    $dateVente = "";
    if (!empty($date1) && !empty($date2) && !empty($iduser)) {
        $dateVente = "$date1 - $date2";
    } elseif (!empty($date1) && empty($date2) && !empty($iduser)) {
        $dateVente = "$date1";
    } elseif (empty($date1) && !empty($date2) && !empty($iduser)) {
        $dateVente = "$date2";
    } elseif (empty($date1) && empty($date2) && !empty($iduser)) {
        // Obtenez la date d'aujourd'hui au format désiré
        $dateVente = date("Y-m-d"); // Format "année-mois-jour"
    }
    
    
    // Affecter le titre à la variable de classe $title
    $pdf->dateVente = $dateVente;

    // Titre du tableau en fonction des critères de la requête
    $nomU = "$personne";
    // if (!empty($date1) && !empty($date2) && !empty($iduser)) {
    //     $nomU = "$personne";
    // } elseif (!empty($date1) && empty($date2) && !empty($iduser)) {
    //     $nomU = "$personne";
    // } elseif (empty($date1) && !empty($date2) && !empty($iduser)) {
    //     $nomU = "$personne";
    // } elseif (empty($date1) && empty($date2) && !empty($iduser)) {
    //     $nomU = "$personne";
    // } 
    
    // Affecter le titre à la variable de classe $title
    $pdf->nomU = $nomU;
    // // Affecter le titre à la variable de classe $title
    // $dateVente = $row[0][1];
    // $pdf->dateVente = $dateVente;

    // echo $dateVente;
    // $pdf->AddPage(); // Ajout d'une page
// Ajouter la première page au PDF
    $pdf->AddPage();
    // Définir les propriétés du document
    $pdf->SetTitle('Rapport');
    // $pdf->SetAuthor('Agoe Assiyeye');
    // $pdf->SetCreator('FPDF');

    // Charger les données à partir de la base de données
    // $data = $pdf->LoadData($conn);

    $conn->close();

    $pdf->FancyTable( $data);

    // Ne pas envoyer de sortie HTML avant la génération du PDF
    $pdfOutput = $pdf->Output('', 'S'); // Stocker le PDF dans une variable

    // Envoyer le PDF en réponse à la requête AJAX
    echo base64_encode($pdfOutput);
    exit; // Arrêter l'exécution du script PHP après l'envoi du PDF
}
?>