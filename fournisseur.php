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


  <main id="main" class="main">

    <div class="pagetitle">
      <h1>FOURNISSEUR</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.php">Home</a></li>
          <li class="breadcrumb-item active">Fournisseur</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    <section class="section">

          <div class="card">
            <div class="card-body">
            <center><p class="h4 text-center">Fournisseurs enregistrés</p>
            <br>
            <form class="container-fluid justify-content-start"><button type="button" class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">AJOUTER UN FOURNISSEUR</button></form></center>
            <table id="example" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nom</th>
                        <th>Ville</th>
                        <th>email</th>
                        <th>telephone</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>Nom</th>
                        <th>Ville</th>
                        <th>email</th>
                        <th>telephone</th>
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
                  <p class="h4 text-center">ENREGISTRER UN FOURNISSEUR</p>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <form class="row g-3 needs-validation" id="myform" novalidate>
                    <div class="col-md-12">
                      <label for="nomC" class="form-label">Nom du fournisseur:</label>
                      <input type="text" class="form-control" id="nomF" name="nomF" required>
                      <div class="invalid-feedback">
                        nom du fournisseur requis!
                      </div>
                    </div>
                    <div class="col-md-12">
                      <label for="villeC" class="form-label">Ville:</label>
                      <input type="text" class="form-control" id="villeF" name="villeF" required>
                      <div class="invalid-feedback">
                        ville requise!
                      </div>
                    </div>
                    <div class="col-md-12">
                      <label for="emailC" class="form-label">email:</label>
                      <input type="email" class="form-control" id="emailF" name="emailF" required>
                      <div class="invalid-feedback">
                        email non valide!
                      </div>
                    </div>
                    <div class="col-md-12">
                      <label for="telC" class="form-label">telephone:</label>
                      <input type="number" class="form-control" id="telF" name="telF" required>
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
                  <p class="h4 text-center">MODIFIER UN FOURNISSEUR</p>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <form class="row g-3 needs-validation" id="editForm" novalidate>
                    <div class="col-md-12">
                      <label for="nomC" class="form-label">Nom du fournisseur:</label>
                      <input type="text" class="form-control" id="nomF1" name="nomF1" required>
                      <div class="invalid-feedback">
                        nom du fournisseur requis!
                      </div>
                    </div>
                    <div class="col-md-12">
                      <label for="villeC" class="form-label">Ville:</label>
                      <input type="text" class="form-control" id="villeF1" name="villeF1" required>
                      <div class="invalid-feedback">
                        ville requise!
                      </div>
                    </div>
                    <div class="col-md-12">
                      <label for="emailC" class="form-label">email:</label>
                      <input type="email" class="form-control" id="emailF1" name="emailF1" required>
                      <div class="invalid-feedback">
                        email non valide!
                      </div>
                    </div>
                    <div class="col-md-12">
                      <label for="telC" class="form-label">telephone:</label>
                      <input type="text" class="form-control" id="telF1" name="telF1" required>
                      <div class="invalid-feedback">
                        numero de telephone requis!
                      </div>
                    </div>
                    <input type="hidden" name="idF1" id="idF1">
                    <div class="card-footer">
                      <div class="col-12 ">
                        <button class="btn btn-outline-danger" type="reset">reset</button>
                        <button class="btn btn-outline-primary" type="submit" id="btn-send">edit</button>
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
  <script src="script/fournisseur.js"></script>
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