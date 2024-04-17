<!DOCTYPE html>
<html lang="en">

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
                <form class="row g-3 needs-validation" id="myform" novalidate>
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
                            <label for="qteProd" class="form-label">Quantite Disponible</label>
                            <input type="number" class="form-control" id="qteProd" name="qteProd" placeholder="" required>
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
                        <div class="col-md-6">
                            <label for="fournisseur" class="form-label">Fournisseur</label>
                            <select type="text" class="form-control" id="fournisseur" name="fournisseur" placeholder="" required></select>
                            <div class="invalid-feedback">
                            fournisseur requis!
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="categoris" class="form-label">Categorie</label>
                            <select type="text" class="form-control" id="categorie" name="categorie" placeholder="" required></select>
                            <div class="invalid-feedback">
                            categoris requise!
                            </div>
                        </div>
                </div>
                <div class="card-footer">
                    <div class="col-12 ">
                        <button class="btn btn-outline-danger" type="reset">reset</button>
                        <button class="btn btn-outline-primary" type="submit" id="btn-send">save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
</main><!-- End #main -->
 
 <?php include "include/footer.php";?>   
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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