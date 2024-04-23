<?php
    ini_set('display_errors', 1);
    ini_set('display_status_errors', 1);
    error_reporting(E_ALL);
require('assets/vendor/fpdf186/fpdf.php');

function genererFacturePDF($idVente) {
    $conn = new mysqli("localhost", "christian", "Christian$1", "pharmacie");
    $sql = "SELECT v.idVente, v.dateVente, v.qteVente, v.prixT, p.nomProd, c.nomClient, v.etat
    FROM ventes v
    JOIN produit p ON v.idProd = p.idProd
    JOIN client c ON v.idClient = c.idClient";
    $result = $conn->query($sql);

    if ($result && $row = $result->fetch_assoc()) {
        // Récupérer les données de la vente
        $idVente = $row['idVente'];
        $dateVente = $row['dateVente'];
        $qteVente = $row['qteVente'];
        $prixT = $row['prixT'];
        $nomProd = $row['nomProd'];
        $nomClient = $row['nomClient'];

        // Créer un nouvel objet PDF
        class CustomPDF extends FPDF {
            // Fonction d'en-tête
            function Header() {
                // Header content here...
            }

            // Fonction de pied de page
            function Footer() {
                // Footer content here...
            }
        }

        $pdf = new CustomPDF();
        $pdf->AliasNbPages();
        $pdf->AddPage();

        // Ajouter les données de la vente à la facture PDF
        $pdf->SetFont('Arial', 'B', 12);
        $pdf->Cell(0, 10, 'ID Vente: ' . $idVente, 0, 1);
        $pdf->Cell(0, 10, 'Date Vente: ' . $dateVente, 0, 1);
        $pdf->Cell(0, 10, 'Quantité Vendue: ' . $qteVente, 0, 1);
        $pdf->Cell(0, 10, 'Prix Total: ' . $prixT, 0, 1);
        $pdf->Cell(0, 10, 'Produit: ' . $nomProd, 0, 1);
        $pdf->Cell(0, 10, 'Client: ' . $nomClient, 0, 1);

        // Sortie du PDF
        $pdfContent = $pdf->Output('S'); // 'S' pour renvoyer le contenu du PDF

        return $pdfContent;
    } else {
        // Si l'ID de la vente n'est pas valide, renvoyer une erreur
        http_response_code(400); // Bad Request
        echo 'Erreur: ID de vente invalide.';
    }

    $conn->close();
}

// Vérifier si l'ID de la vente est reçu en POST
if (isset($_POST['idVente'])) {
    // Générer la facture PDF en fonction de l'ID de la vente reçu en POST
    $idVente = $_POST['idVente'];
    $pdfContent = genererFacturePDF($idVente);

    // Renvoyer le contenu du PDF généré en réponse
    header('Content-Type: application/pdf');
    echo $pdfContent;
} else {
    // Si l'ID de la vente n'est pas fourni en POST, renvoyer une erreur
    http_response_code(400); // Bad Request
    echo 'Erreur: ID de vente manquant.';
}
?>
