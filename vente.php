<!DOCTYPE html>
<html lang="en">
<?php include "tet.php"?>

<?php 
// include "tet.php"
?>
<?php include "include/header.php"?>

<body>
<!-- navbar -->
<?php include "include/navbar.php"?>

<!-- sidebar -->
<?php include "include/sidebar.php"?>
<!-- Select2 CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet">
<!-- Inclure jQuery -->
<script src="assets/vendor/jquery-3.6.0.min.js"></script>


<!-- Inclure DataTables -->
<link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

<!-- contain page -->
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

      <div>
        <!-- Form with validation -->
        <form id="venteForm" action="#" method="POST" novalidate>
          <div class="form-group">
              <label for="client">Client:</label>
              <select id="client" name="client" class="form-control" required></select>
          </div>
          <div class="form-group">
              <label for="quantite">Quantité vendue:</label>
              <input type="number" id="quantite" name="quantite" class="form-control" required>
          </div>
          <div class="form-group">
                <label for="produit">Produit:</label>
                <select id="produit" name="produit" class="form-control"></select>
                <button id="addToCartBtn" class="btn btn-primary">Ajouter au panier</button>
            </div>
          <div class="form-group">
          <div id="cartItems"></div>
              <div class="card mt-3">
                  <div class="card-body">
                      <h5 class="card-title">Prix Total</h5>
                      <input type="text" id="totalPriceInput" class="form-control" readonly>
                  </div>
              </div>
          </div>
          <button type="submit" class="btn btn-primary" id="btnEnregistrer">Enregistrer</button>
      </form>

      </div>

<!-- jQuery -->
<table id="ventesTable" class="display" style="width:100%">
    <thead>
        <tr>
            <th>ID Vente</th>
            <th>Date de vente</th>
            <th>Quantité vendue</th>
            <th>Prix total</th>
            <th>Nom Produit</th>
            <th>Nom Client</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>
<!-- Modal de Suppression -->
<div class="modal fade" id="modalSuppression" tabindex="-1" role="dialog" aria-labelledby="modalSuppressionLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalSuppressionLabel">Confirmation de Suppression</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Afficher les informations à supprimer ici -->
                <div class="form-group">
                    <label for="idVenteSuppression">ID Vente:</label>
                    <input type="text" id="idVenteSuppression" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="dateVenteSuppression">Date de vente:</label>
                    <input type="text" id="dateVenteSuppression" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="qteVenteSuppression">Quantité vendue:</label>
                    <input type="text" id="qteVenteSuppression" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="prixTSuppression">Prix total:</label>
                    <input type="text" id="prixTSuppression" class="form-control" readonly>
                </div>
                <!-- Ajoutez d'autres champs selon vos besoins -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-danger" id="btnConfirmerSuppression">Confirmer la Suppression</button>
            </div>
        </div>
    </div>
</div>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap.min.js"></script>
  <!-- Select2 JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
  <!-- <script src="assets/vendor/dataTables.bootstrap5.js"></script> -->

  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="cart.js"></script>
<script>
$(document).ready(function() {
    var cartItems = []; // Initialisez cartItems comme un tableau vide

    // Appel AJAX pour envoyer les données au script PHP lors de la soumission du formulaire
    $('#venteForm').on('submit', function(event) {
        event.preventDefault(); // Empêcher le comportement par défaut du formulaire

        var idClient = $('#client').val();
        var qteVente = $('#quantite').val();
        var prixT = $('#totalPriceInput').val(); // Vous devez ajouter un ID à votre champ de prix total pour récupérer sa valeur
        var idProd = $('#produit').val();
        // var idProd = cartItems.map(item => item.id).join(',');

        // Envoyer les données au script PHP pour traitement
        $.ajax({
            url: 'traitement_vente.php',
            type: 'POST',
            data: {
                client: idClient,
                quantite: qteVente,
                prixTotal: prixT,
                idProduit: idProd
            },
            success: function(response) {
                // Gérer la réponse du script PHP après l'insertion des données
                console.log(response);
                // Réinitialiser le panier et le formulaire après l'enregistrement de la vente
                cartItems = [];
                function updateCart() {
                    $('#cartItems').empty();
                    totalPrice = 0;
                    var totalQuantity = 0; // Ajout de la variable pour stocker la quantité totale

                    cartItems.forEach(function(item) {
                        var price = item.price * item.quantity;
                        totalPrice += price;
                        totalQuantity += item.quantity; // Ajout de la quantité de chaque produit au total
                        $('#cartItems').append('<div>' + item.name + ' - ' + item.price + ' € <span class="badge badge-primary">' + item.quantity + '</span> ' + price.toFixed(2) + ' € <button class="btn btn-sm btn-danger removeFromCart" data-id="' + item.id + '">Retirer</button></div>');
                    });

                    $('#totalPriceInput').val(totalPrice.toFixed(2) + ' €');
                    $('#quantite').val(totalQuantity); // Mettre à jour le champ de quantité avec la quantité totale
                }
                updateCart();
                $('#venteForm')[0].reset(); // Réinitialiser le formulaire
                location.reload();
            },
            error: function() {
                alert('Erreur lors de l\'enregistrement de la vente.');
            }
        });
    });

});

</script>
  <script>
$(document).ready(function() {
    var table = $('#ventesTable').DataTable({
        "ajax": {
            "url": "liste_ventes.php",
            "dataSrc": ""
        },
        "columns": [
            { "data": "idVente" },
            { "data": "dateVente" },
            { "data": "qteVente" },
            { "data": "prixT" },
            { "data": "nomProd" },
            { "data": "nomClient" },
            {
                "data": null,
                "render": function(data, type, row, meta) {
                    return "<a href= 'assets/vendor/alpha/facture.php'><button class='btn btn-success btnImprimer' data-id='" + row.idVente + "'>Imprimer</button></a> <button class='btn btn-danger btnSupprimer'>Supprimer</button>";
                }
            }
        ]
    });

    // Gérer le clic sur le bouton "Imprimer"
    $('#ventesTable').on('click', '.btnImprimer', function() {
    var idVente = $(this).data('id');
    
        // Requête AJAX pour générer la facture PDF
        // $.ajax({
        //     url: 'generer_facture.php', // Assurez-vous de remplacer 'generer_facture.php' par le chemin correct de votre script PHP
        //     type: 'POST',
        //     data: { idVente: idVente },
        //     success: function(response) {
        //         // Télécharger le fichier PDF généré
        //         var blob = new Blob([response]);
        //         var link = document.createElement('a');
        //         link.href = window.URL.createObjectURL(blob);
        //         link.download = 'facture.pdf';
        //         document.body.appendChild(link);
        //         link.click();
        //         document.body.removeChild(link);
        //     },
        //     error: function() {
        //         alert('Erreur lors de la génération de la facture PDF.');
        //     }
        // });
    });
});
</script>

<script>
  $(document).ready(function() {
    $.ajax({
          url: 'charger_clients.php',
          type: 'GET',
          dataType: 'json',
          success: function(data) {
              $('#client').empty(); // Efface les options existantes avant de charger les nouvelles données
              $.each(data, function(index, item) {
                  $('#client').append('<option value="' + item.idClient + '">' + item.nomClient + '</option>');
              });
              $('#client').trigger('change'); // Met à jour le Select2 après avoir ajouté les options
          },
          error: function() {
              alert('Une erreur s\'est produite lors de la récupération des données.');
          }
      });
    });
</script>
</body>

</html>