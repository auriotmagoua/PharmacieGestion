<!DOCTYPE html>
<html lang="en">

<!-- Lien de non connection -->
<?php include "tet.php"?>

<?php include "include/header.php"?>
<!-- select2  link-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>


<body>

  <!-- navbar -->
<?php include "include/navbar.php"?>

<!-- sidebar -->
<?php include "include/sidebar.php"?>


  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Produits</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.php">Home</a></li>
          <li class="breadcrumb-item active">Produits</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    <section class="section">

    <div class="card">
      <div class="card-header">
        <p class="h4 text-center">PRODUIT ENREGISTRER</p>
      </div>
      <div class="card-body">
      <!-- <form class="container-fluid justify-content-start"><button type="button" class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">AJOUTER UN CLIENT</button></form></center> -->
      <table id="example" class="display table table-bordered  table-bordered " style="width:100%">
          <thead>
            <tr>
              <th>#</th>
              <th>nomProd</th>
              <th>imageProd</th>
              <th>numLot</th>
              <th>datePerem</th>
              <th>qteDispo</th>
              <th>PrixU</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
              <tr>
                  <th>#</th>
                  <th>nomProd</th>
                  <th>imageProd</th>
                  <th>numLot</th>
                  <th>datePerem</th>
                  <th>qteDispo</th>
                  <th>PrixU</th>
                  <th>Action</th>
              </tr>
          </tfoot>
        </table>
      </div>
    </div>

  <!-- add modal -->
  <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <p class="h4 text-center">ENREGISTRER UN CLIENT</p>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form class="row g-3 needs-validation" id="myform" novalidate>
            <div class="col-md-12">
              <label for="nomC" class="form-label">Nom du client:</label>
              <input type="text" class="form-control" id="nomC" name="nomC" required>
              <div class="invalid-feedback">
                nom du client requis!
              </div>
            </div>
            <div class="col-md-12">
              <label for="villeC" class="form-label">Ville:</label>
              <input type="text" class="form-control" id="villeC" name="villeC" required>
              <div class="invalid-feedback">
                ville requise!
              </div>
            </div>
            <div class="col-md-12">
              <label for="emailC" class="form-label">email:</label>
              <input type="email" class="form-control" id="emailC" name="emailC" required>
              <div class="invalid-feedback">
                email not valide!
              </div>
            </div>
            <div class="col-md-12">
              <label for="telC" class="form-label">telephone:</label>
              <input type="number" class="form-control" id="telC" name="telC" required>
              <div class="invalid-feedback">
                numero de telephone requis!
              </div>
            </div>
            <div class="card-footer">
              <div class="col-12 ">
                <button class="btn btn-outline-danger" type="reset">reset</button>
                <button class="btn btn-outline-primary" type="submit" id="btn-send">save</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- edit modal -->
  <div class="modal fade" id="editModalToggle" aria-hidden="true" aria-labelledby="editModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <p class="h4 text-center">MODIFIER UN PRODUIT</p>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        <!-- needs-validation -->
          <form class="row g-3 " id="editForm" novalidate>
            <div class="col-md-12">
              <label for="nomProd" class="form-label">Nom du produit:</label>
              <input type="text" class="form-control" id="nomProd" name="nomProd" required>
              <div class="invalid-feedback">
                nom du client requis!
              </div>
            </div>
            <div class="col-md-12">
              <label for="numLot" class="form-label">numero du Lot:</label>
              <input type="number" class="form-control" id="numLot" name="numLot" required>
              <div class="invalid-feedback">
              numero du Lot requise!
              </div>
            </div>
            <div class="col-md-12">
              <label for="imageProd" class="form-label">image du produit:</label>
              <input type="file" class="form-control" id="imageProd" name="imageProd" required>
              <div class="invalid-feedback">
              image du produit requise!
              </div>
            </div>
            <div class="col-md-12">
              <label for="datePerem" class="form-label">date de Peremption:</label>
              <input type="date" class="form-control" id="datePerem" name="datePerem" required>
              <div class="invalid-feedback">
                date de Peremption requise!
              </div>
            </div>
            <div class="col-md-12">
              <label for="qteDispo" class="form-label">quantite Dispo:</label>
              <input type="number" class="form-control" id="qteDispo" name="qteDispo" required>
              <div class="invalid-feedback">
              quantite disponible requis!
              </div>
            </div>
            <div class="col-md-12">
              <label for="prixU" class="form-label">prix Unitaire:</label>
              <input type="number" class="form-control" id="prixU" name="prixU" required>
              <div class="invalid-feedback">
                prix Unitaire requise!
              </div>
            </div>
            <div class="col-md-12">
              <label for="idCategorie" class="form-label">Categorie:</label>
              <input type="number" class="form-control" id="idCategorie" name="idCategorie" required>
            <!-- </select> -->
              <div class="invalid-feedback">
              Categorie requise!
              </div>
            </div>
            <div class="col-md-4">
              <label for="idCategorie" class="form-label">image preview:</label>
              <img class="form-control" src="" alt="" with="40" height="100" id="image-preview">
            </div>
            <input type="hidden" name="idProd" id="idProd">
            <div class="card-footer">
              <div class="col-12 ">
                <button class="btn btn-outline-danger" type="reset">cancel</button>
                <button class="btn btn-outline-primary" type="submit" id="btn-send">save</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  </section>

  </main><!-- End #main -->

  <?php include "include/footer.php";?>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="script/listProd.js"></script>
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
  <script>
    // chargement des  categories dans le select 2
    $(document).ready(function() {
      $('#idCategorie').select2();

      // Effectuer une requête AJAX pour récupérer les données de la base de données
      $.ajax({
        url: 'getCategorie.php', // Remplacez "obtenir_donnees.php" par votre script de récupération de données
        type: 'GET',
        minLength: 1,
        dataType: 'json',
        success: function(data) {
          // Parcourir les données et générer les options de l'élément select
          for (var i = 0; i < data.length; i++) {
            $('#idCategorie').append('<option value="' + data[i].idCategorie + '">' + data[i].nomCategorie + '</option>');
          }
        },
        error: function() {
          alert('Une erreur s\'est produite lors de la récupération des données.');
        }
      });
  });
  </script>
</body>
</html>