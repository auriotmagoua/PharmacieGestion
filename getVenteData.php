<?php
// Connexion à la base de données (vous devrez peut-être modifier ces paramètres)
require_once 'connexiondb.php';
$conn = connexionMysqli();

// Requête SQL pour récupérer les données de la base de données
$sql = "SELECT 
            ventes.idVente, 
            ventes.dateVente, 
            ventes.qteVente, 
            ventes.numFact, 
            produit.nomProd, 
            client.nomClient
            FROM 
            ventes
            JOIN 
             produit ON ventes.idProd = produit.idProd
            JOIN 
             client ON ventes.idClient = client.idClient 
            WHERE  ventes.etat = 'active'";
$result = $conn->query($sql);

// Vérification s'il y a des résultats
if ($result->num_rows > 0) {
    // Parcourir les résultats et générer du code HTML pour chaque ligne de données
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["idVente"] . "</td>";
        echo "<td>" . $row["dateVente"] . "</td>";
        echo "<td>" . $row["qteVente"] . "</td>";
        echo "<td>" . $row["numFact"] . "</td>";
        echo "<td>" . $row["nomProd"] . "</td>";
        
        echo "<td>" . $row["nomClient"] . "</td>";
        echo '<td><button class="btn btn-outline-success btn-facture" data-fact-id="' . $row["numFact"] . '">Imprimer</button></td>';
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='4'>Aucune donnée disponible</td></tr>";
}

// Fermeture de la connexion
$conn->close();
?>
