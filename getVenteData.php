

<?php

 // Connexion à la base de données (vous devrez peut-être modifier ces paramètres)
require_once 'connexiondb.php';
$conn = connexionMysqli();
// Requête SQL pour récupérer les données
$sql = "SELECT 
            MAX(ventes.idVente) AS idVente,
            MAX(ventes.dateVente) AS dateVente, 
            MAX(ventes.qteVente) AS qteVente, 
            ventes.numFact, 
            MAX(produit.nomProd) AS nomProd, 
            MAX(client.nomClient) AS nomClient
        FROM 
            ventes
        JOIN 
            produit ON ventes.idProd = produit.idProd
        JOIN 
            client ON ventes.idClient = client.idClient 
        WHERE  
            ventes.etat = 'active'
        GROUP BY 
            ventes.numFact
        ORDER BY 
            MAX(ventes.idVente) DESC";

$result = $conn->query($sql);

// Tableau pour stocker les données
$data = array();

// Parcourir les résultats de la requête et les stocker dans le tableau
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
<<<<<<< HEAD
        $row['id'] = $row['idVente']; // Utiliser 'idProd' comme 'id'
        $data[] = $row;
=======
>>>>>>> 035d8a20d976a2f632acc5c3185bff36e40c7fde
    }
}

// Fermer la connexion à la base de données
$conn->close();

// Envoyer les données au format JSON
echo json_encode($data);
?>
