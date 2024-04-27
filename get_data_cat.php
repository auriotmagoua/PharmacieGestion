<?php
// Connexion à la base de données (vous devrez peut-être modifier ces paramètres)
require_once 'connexiondb.php';
$conn = connexionMysqli();

// Requête SQL pour récupérer les données de la base de données
$sql = "SELECT * FROM categorie WHERE etat='active'";
$result = $conn->query($sql);

// Vérification s'il y a des résultats
if ($result->num_rows > 0) {
    // Parcourir les résultats et générer du code HTML pour chaque ligne de données
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["idCategorie"] . "</td>";
        echo "<td>" . $row["nomCategorie"] . "</td>";
     
        echo '<td>
        <button class="btn btn-outline-danger btn-delete" data-cat-id="' . $row["idCategorie"] . '">Supprimer</button>
        <button class="btn btn-outline-success btn-update" data-catU-id="' . $row["idCategorie"] . '">modifier</button>
        </td>';
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='4'>Aucune donnée disponible</td></tr>";
}

// Fermeture de la connexion
$conn->close();
?>
