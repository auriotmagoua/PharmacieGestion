<?php
require_once('assets/vendor/fpdf186/fpdf.php');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Connexion à la base de données
    include 'connexiondb.php';

    $conn = connexionMysqli();

    // Récupération des valeurs du formulaire
    $date1 = !empty($_POST['dateD']) ? $conn->real_escape_string($_POST['dateD']) : '';
    $date2 = !empty($_POST['dateF']) ? $conn->real_escape_string($_POST['dateF']) : '';
    $idfour = !empty($_POST['select-autocomplete']) ? $conn->real_escape_string($_POST['select-autocomplete']) : '';

    class PDF extends FPDF
    {
        public $title; // Déclarer la variable $title comme globale

        // Méthode pour l'en-tête
        function Header()
        {
            // Titre encadré centré
            $this->SetFont('Arial', 'B', 12);
            $this->Cell(0, 10, $this->title, 1, 1, 'C'); // Utilisation de $this->title pour accéder à la variable de classe
            $this->Ln(10); // Saut de ligne pour éviter que le texte ne chevauche le contenu
            
            // En-tête du tableau
            $header = array('num Approv',  'Qte Approv', 'date Approv', 'prixU', 'Nom Prod','Nom Four');
            $columnWidths = array(40, 40, 40, 30, 85, 40); // Largeurs des colonnes en millimètres

            // Définir la police et la taille pour l'en-tête du tableau
            $this->SetFont('Arial', 'B', 12);
            for ($i = 0; $i < count($header); $i++) {
                $this->Cell($columnWidths[$i], 10, $header[$i], 1, 0, 'C');
            }
            $this->Ln(); // Saut de ligne après l'en-tête du tableau
        }

        // Tableau simple
        function BasicTable($data)
        {
            // Définir les largeurs des colonnes
            $columnWidths = array(40, 40, 40, 30, 85, 40); // Largeurs des colonnes en millimètres

            // Données
            $this->SetFont('Arial', '', 10);
            foreach ($data as $row) {
                for ($i = 0; $i < count($row); $i++) {
                    $this->Cell($columnWidths[$i], 10, $row[$i], 1, 0, 'C');
                }
                $this->Ln();
            }
        }
    }


    $pdf = new PDF('L'); // 'L' indique l'orientation paysage
    $pdf->SetFont('Arial', '', 10); // Réduire la taille de la police
    
    // Titre du tableau en fonction des critères de la requête
    $title = "Approvisionnements";
    if (!empty($date1) && !empty($date2) && !empty($idfour)) {
        $title = "Approvisionnements entre $date1 et $date2 de $idfour";
    } elseif (!empty($date1) && empty($date2) && !empty($idfour)) {
        $title = "Approvisionnements pour la date $date1 de $idfour";
    } elseif (empty($date1) && !empty($date2) && !empty($idfour)) {
        $title = "Approvisionnements pour la date $date2 de $idfour";
    } elseif (!empty($date1) && !empty($date2) && empty($idfour)) {
        $title = "Approvisionnements entre $date1 et $date2";
    } elseif (!empty($date1) && empty($date2) && empty($idfour)) {
        $title = "Approvisionnements pour la date $date1";
    } elseif (empty($date1) && !empty($date2) && empty($idfour)) {
        $title = "Approvisionnements pour la date $date2";
    } elseif (empty($date1) && empty($date2) && !empty($idfour)) {
        $title = "Approvisionnements de $idfour";
    } elseif (empty($date1) && empty($date2) && empty($idfour)) {
        $title = "Tous les approvisionnements ";
    }
    
    // Affecter le titre à la variable de classe $title
    $pdf->title = $title;
    
    // Ajouter la première page au PDF
    $pdf->AddPage();
    
  

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
                fournisseur ON approvisionnement.idFournis = fournisseur.idFournis";

    if (empty($date1) && empty($date2) && empty($idfour)) {
        $sql .= " WHERE approvisionnement.etat = 'active'";
    } elseif (!empty($date1) && empty($date2) && empty($idfour)) {
        $sql .= " WHERE approvisionnement.dateAppro = '$date1'";
    } elseif (empty($date1) && !empty($date2) && empty($idfour)) {
        $sql .= " WHERE approvisionnement.dateAppro = '$date2'";
    } elseif (empty($date1) && empty($date2) && !empty($idfour)) {
        $sql .= " WHERE approvisionnement.idFournis = '$idfour'";
    } elseif (!empty($date1) && !empty($date2) && empty($idfour)) {
        if ($date2 < $date1) {
            $temp = $date1;
            $date1 = $date2;
            $date2 = $temp;
        }
        $sql .= " WHERE DATE(approvisionnement.dateAppro) BETWEEN '$date1' AND '$date2'";
    } elseif (!empty($date1) && empty($date2) && !empty($idfour)) {
        $sql .= " WHERE approvisionnement.dateAppro = '$date1' AND approvisionnement.idFournis = '$idfour'";
    } elseif (empty($date1) && !empty($date2) && !empty($idfour)) {
        $sql .= " WHERE approvisionnement.dateAppro = '$date2' AND approvisionnement.idFournis = '$idfour'";
    } elseif (!empty($date1) && !empty($date2) && !empty($idfour)) {
        if ($date2 < $date1) {
            $temp = $date1;
            $date1 = $date2;
            $date2 = $temp;
        }
        $sql .= " WHERE DATE(approvisionnement.dateAppro) BETWEEN '$date1' AND '$date2' AND approvisionnement.idFournis = '$idfour'";
    }

    $result = $conn->query($sql);

    $data = array();
    if ($result->num_rows > 0) {
        // Récupérer chaque ligne de données
        $i=1;
        while ($row = $result->fetch_assoc()) {
           
            $data[] = array($i, $row["qteAppro"], $row["dateAppro"], $row["prixU"], $row["nomProd"], $row["nomFournis"]);
            $i++;
        }
    } else {
        echo "0 results";
    }

    $conn->close();

    $pdf->BasicTable( $data);

    // Ne pas envoyer de sortie HTML avant la génération du PDF
    $pdfOutput = $pdf->Output('', 'S'); // Stocker le PDF dans une variable

    // Envoyer le PDF en réponse à la requête AJAX
    echo base64_encode($pdfOutput);
    exit; // Arrêter l'exécution du script PHP après l'envoi du PDF

   
}
?>


