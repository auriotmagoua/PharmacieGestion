<?php
// Connexion à la base de données (vous devrez peut-être modifier ces paramètres)
require_once 'connexiondb.php';
$conn = connexionMysqli();

// Requête SQL pour récupérer les données de la base de données
$sql = "SELECT * FROM user WHERE etat='active'";
$result = $conn->query($sql);

// Vérification s'il y a des résultats
if ($result->num_rows > 0) {
    // Parcourir les résultats et générer du code HTML pour chaque ligne de données
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["idU"] . "</td>";
        echo "<td>" . $row["nomU"] . "</td>";
        echo "<td>" . $row["login"] . "</td>";
        echo '<td><button class="btn btn-outline-success btn-delete" data-user-id="' . $row["idU"] . '">Supprimer</button></td>';
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='4'>Aucune donnée disponible</td></tr>";
}

// Fermeture de la connexion
$conn->close();
?>
