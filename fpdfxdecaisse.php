
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
        public $title; // Déclarer la variable $title comme globale

        // Méthode pour l'en-tête
        function Header()
        {
            // Titre encadré centré
            $this->SetFont('Arial', 'B', 12);
            $this->Cell(0, 10, $this->title, 1, 1, 'C'); // Utilisation de $this->title pour accéder à la variable de classe
            $this->Ln(10); // Saut de ligne pour éviter que le texte ne chevauche le contenu
            
            // En-tête du tableau
            $header = array('num Vente',  'date Vente', 'qte Vente', 'numFAct', 'nomProd','idClient','nom user');
            $columnWidths = array(25, 40, 25, 30, 70, 40,40); // Largeurs des colonnes en millimètres

            // Définir la police et la taille pour l'en-tête du tableau
            $this->SetFont('Arial', 'B', 12);
            for ($i = 0; $i < count($header); $i++) {
                $this->Cell($columnWidths[$i], 10, $header[$i], 1, 0, 'C');
            }
            $this->Ln(); // Saut de ligne après l'en-tête du tableau
        }

        // Tableau simple
      // Tableau simple
      function BasicTable($data)
      {
          // Définir les largeurs des colonnes
          $columnWidths = array(25, 40, 25, 30, 70, 40,40); // Largeurs des colonnes en millimètres

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
    $title = "Ventes";
    if (!empty($date1) && !empty($date2) && !empty($iduser)) {
        $title = "Ventes entre $date1 et $date2 pas $personne";
    } elseif (!empty($date1) && empty($date2) && !empty($iduser)) {
        $title = "Ventes de  la date $date1 par $personne";
    } elseif (empty($date1) && !empty($date2) && !empty($iduser)) {
        $title = "Ventes de la date $date2 par $personne";
    } elseif (empty($date1) && empty($date2) && !empty($iduser)) {
        $title = "Ventes faite par $personne";
    } 
    
    // Affecter le titre à la variable de classe $title
    $pdf->title = $title;
    
    // Ajouter la première page au PDF
    $pdf->AddPage();
    
  

    // Requête pour récupérer les données de la table produit
    $sql = "SELECT 
                ventes.idVente, 
                ventes.dateVente, 
                ventes.qteVente, 
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
        $sql .= " WHERE ventes.idU = '$iduser'";
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

    $data = array();
    if ($result->num_rows > 0) {
        // Récupérer chaque ligne de données
        $i=1;
        while ($row = $result->fetch_assoc()) {
           
            $data[] = array( $i, $row["dateVente"], $row["qteVente"], $row["numFact"], $row["nomProd"], $row["nomClient"], $row["nomU"]);

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


