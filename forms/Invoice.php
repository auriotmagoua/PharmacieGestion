<?php
// Vérification si le formulaire est soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les données du formulaire
    $supplierName = $_POST['supplierName'];
    $productNames = $_POST['productName'];
    $numBL = $_POST['numBL'];
    $quantities = $_POST['quantity'];
    $prices = $_POST['price'];
    $etat = 'active';
	
    // Connexion à la base de données
    include '../connexiondb.php';
	$conn = connexionMysqli();

    // Vérifier la connexion
    if ($conn->connect_error) {
        die("Connexion échouée: " . $conn->connect_error);
    }

    // Insérer les données dans la table approvisionnement
    $dateAppro = date("Y-m-d"); // Date d'approvisionnement actuelle
    // $idProd = "SELECT idProd FROM `produit` WHERE nomProd = '$productNames'"; // ID du produit (à remplacer par votre logique)
    // Obtenir l'ID du fournisseur
	$idFournis = 0; // Initialiser l'ID du fournisseur à une valeur par défaut

	// Requête SQL pour obtenir l'ID du fournisseur
	$sql = "SELECT idFournis FROM `fournisseur` WHERE nomFournis = '$supplierName'";

	$result = mysqli_query($conn, $sql);

	// Vérifier si la requête a réussi
	if ($result) {
		// Vérifier si des lignes ont été retournées
		if (mysqli_num_rows($result) > 0) {
			// Récupérer la première ligne de résultat
			$row = mysqli_fetch_assoc($result);

			// Récupérer l'ID du fournisseur
			$idFournis = intval($row['idFournis']);
		}
	}

    // Boucle à travers les produits et les insérer dans la table
    for ($i = 0; $i < count($productNames); $i++) {
        $productName = intval($productNames[$i]);
        // $productcode = intval($productcodes[$i]);
        $quantity = intval($quantities[$i]);
        $price = floatval($prices[$i]);

		// Préparer la requête d'insertion
		$stmt = $conn->prepare("INSERT INTO approvisionnement (numBL, qteAppro, prixU, dateAppro, idProd, idFournis, etat) VALUES (?, ?, ?, ?, ?, ?, ?)");
		$stmt->bind_param("sssssss", $numBL, $quantity, $price, $dateAppro, $productName, $idFournis, $etat);
	
		if ($stmt->execute()) {
			$sql1 = "UPDATE produit SET qteDispo = qteDispo + $quantity WHERE idProd = $productName";
            $res = $conn->query($sql1);
			// echo 'succes de l\'enregistrement';
			$response = array(
				'statusCode' => 200,
				'message' => 'produit(s) ajouté(s) avec succès'
			);
		} else {
			// echo 'echec de l\'enregistrement';
			$response = array(
				'statusCode' => 500,
				'message' => 'Erreur lors de l\'insertion du/des produit(s) : ' . $stmt->error
			);
		}
	
		// Fermer la connexion et libérer les ressources
		$stmt->close();
    }

    // Fermer la connexion
    $conn->close();

	// Retourner la réponse au format JSON
    header('Content-Type: application/json');
    echo json_encode($response);
}
?>
