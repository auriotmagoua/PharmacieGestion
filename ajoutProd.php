<!DOCTYPE html>
<html lang="en">
    
<!-- Lien de non connection -->
<?php include "tet.php"?>
<?php include "include/header.php"?>


<body>
<!-- navbar -->
<?php include "include/navbar.php"?>

<!-- sidebar -->
<?php include "include/sidebar.php"?>


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

<section class="section dashboard">
    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8 justify-content-center align-items-center card">
            <div class="row">
                <form class="row g-3 needs-validation" id="myform" novalidate enctype="multipart/form-data">
                    <div class="card-header">
                        <p class="h4 text-center">ENREGISTRER UN PRODUIT</p>
                    </div>
                        <div class="col-md-12">
                            <label for="nomProd" class="form-label">Nom produit:</label>
                            <input type="text" class="form-control" id="nomProd" name="nomProd" placeholder="enter un nom" required>
                            <div class="invalid-feedback">
                            nom produit requis!
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="numLot" class="form-label">Numero lot:</label>
                            <input type="number" class="form-control" id="numLot" name="numLot" placeholder="" required>
                            <div class="invalid-feedback">
                            numero de lot requis
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="datePerem" class="form-label">Date peremption</label>
                            <div class="input-group has-validation">
                            <input type="date" class="form-control" id="datePerem" name="datePerem" placeholder="" aria-describedby="inputGroupPrepend" required>
                            <div class="invalid-feedback">
                                date peremption requise!
                            </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="qteDispo" class="form-label">Quantite Disponible</label>
                            <input type="number" class="form-control" id="qteDispo" name="qteDispo" placeholder="" required>
                            <div class="invalid-feedback">
                            quantite de produit requise!
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="prixU" class="form-label">Prix unitaire</label>
                            <input type="number" class="form-control" id="prixU" name="prixU" placeholder="" required>
                            <div class="invalid-feedback">
                            prix unitaire requis!
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="fournisseur" class="form-label">Fournisseur</label>
                            <select type="text" class="form-control" id="fournisseur" name="fournisseur" placeholder="" required></select>
                            <div class="invalid-feedback">
                            fournisseur requis!
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="categoris" class="form-label">Categorie</label>
                            <select type="text" class="form-control" id="categorie" name="categorie" placeholder="" required></select>
                            <div class="invalid-feedback">
                            categoris requise!
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="imageProd" class="form-label">image</label>
                            <input type="file" class="form-control" id="imageProd" name="imageProd" placeholder="" required>
                            <div class="invalid-feedback">
                            categoris requise!
                            </div>
                        </div>
                </div>
                <div class="card-footer">
                    <div class="col-12 ">
                    <input type="hidden" name="type" value="1">
                        <button class="btn btn-outline-danger" type="reset">reset</button>
                        <button class="btn btn-outline-primary" type="submit" id="btn-save">save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<script>

    // chargement des  fournisseur dans le select 2
    $(document).ready(function() {
        $('#fournisseur').select2();

        // Effectuer une requête AJAX pour récupérer les données de la base de données
        $.ajax({
            url: 'getFournis.php', // Remplacez "obtenir_donnees.php" par votre script de récupération de données
            type: 'GET',
            minLength: 1,
            dataType: 'json',
            success: function(data) {
                // Parcourir les données et générer les options de l'élément select
                for (var i = 0; i < data.length; i++) {
                    $('#fournisseur').append('<option value="' + data[i].idFournis + '">' + data[i].nomFournis + '</option>');
                }
            },
            error: function() {
                alert('Une erreur s\'est produite lors de la récupération des données.');
            }
        });
    });


     // chargement des  categories dans le select 2
    $(document).ready(function() {
        $('#categorie').select2();

        // Effectuer une requête AJAX pour récupérer les données de la base de données
        $.ajax({
            url: 'getCategorie.php', // Remplacez "obtenir_donnees.php" par votre script de récupération de données
            type: 'GET',
            minLength: 1,
            dataType: 'json',
            success: function(data) {
                // Parcourir les données et générer les options de l'élément select
                for (var i = 0; i < data.length; i++) {
                    $('#categorie').append('<option value="' + data[i].idCategorie + '">' + data[i].nomCategorie + '</option>');
                }
            },
            error: function() {
                alert('Une erreur s\'est produite lors de la récupération des données.');
            }
        });
    });

        // envoyer les donnees a  save.php pour enregistrement
   $(document).on("click", "#btn-save", function (e) {
        e.preventDefault();
        var formData = new FormData($("#myform")[0]);
        console.log(formData);
        $.ajax({
            data: formData,
            type: "post",
            url: "save.php",
            dataType: "json",
            processData: false,
            contentType: false,
            success: function (response) {
                if (response.statusCode == 200) {
                    toastr.success('Produits enregistrées avec succès');
                    $("#myform")[0].reset();
                } else{
                    toastr.error('Erreur l\'or de l\'enregistrement');
                }
            },
            error: function(xhr,status,error) {
                toastr.warning('Erreur dans votre requette ajax');
            }
        });
    });



    $(document).ready(function() {
    toastr.options = {
        'closeButton': true,
        'debug': false,
        'newestOnTop': false,
        'progressBar': true,
        'positionClass': 'toast-top-center',
        'preventDuplicates': false,
        'showDuration': '1000',
        'hideDuration': '1000',
        'timeOut': '5000',
        'extendedTimeOut': '1000',
        'showEasing': 'swing',
        'hideEasing': 'linear',
        'showMethod': 'fadeIn',
        'hideMethod': 'fadeOut'
    };
});
</script>
</main><!-- End #main -->
 
 <?php include "include/footer.php";?>   
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  
  <script src="script/script.js"></script>
  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>