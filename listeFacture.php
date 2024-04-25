<!DOCTYPE html>
<html lang="en">
<?php include "tet.php"?>

<?php include "include/header.php"?>
  <!-- datatable link -->
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"> -->
  <!-- <link rel="stylesheet" href="https://cdn.datatables.net/2.0.4/css/dataTables.bootstrap5.css"> -->
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script> -->
  <script src="https://cdn.datatables.net/2.0.4/js/dataTables.js"></script>
  <script src="https://cdn.datatables.net/2.0.4/js/dataTables.bootstrap5.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

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
            <!-- <div class="col-lg-2"></div> -->
            <div class="col-lg-12  card">
                <div class="row">
                    <table id="dataTable" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>IDVente</th>
                                <th>dateVente</th>
                                <th>qteVendu</th>
                                <th>numFactur</th>
                                <th>Nom Produit</th>
                                <th>Client</th>
                                <th>Action</th>                                                                                                                                                                                                                                                                                                                                      
                            </tr>
                        </thead>
                        <tbody>
                         
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</main><!-- End #main -->

<!-- start modal to delete -->
<!-- <div class="modal fade" id="delete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Delect Admin</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="modal-body">
            <form class="row g-3 needs-validation" id="myform" novalidate>
                <div class="col-md-12">
                    <label for="nomProd" class="form-label">Nom Admin:</label>
                    <input type="text" class="form-control" id="nomProd" name="nomProd" placeholder="enter un nom" required>
                    <div class="invalid-feedback">
                    nom produit requis!
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="numLot" class="form-label">Login :</label>
                    <input type="text" class="form-control" id="numLot" name="numLot" placeholder="" required>
                    <div class="invalid-feedback">
                    numero de lot requis
                    </div>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <div class="col-12">
                    <div class="d-flex justify-content-center">
                    <button class="btn btn-outline-danger" data-bs-dismiss="modal">cancel</button>
                    <button class="btn btn-outline-primary mx-3" type="submit" id="btn-send">Supprimer</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
  </div>
</div> -->
<!--end modal to delete -->
 
<?php include "include/footer.php";?>   
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="script/script.js"></script>
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
$(document).ready(function() {
    $('#dataTable').DataTable({
        "ajax": {
            "url": "getVenteData.php",
            "dataSrc": ""
        },
        "columns": [
            {"data": "idVente"},
            {"data": "dateVente"},
            {"data": "qteVente"},
            {"data": "numFact"},
            {"data": "nomProd"},
            {"data": "nomClient"},
            {
                "render": function(data, type, row) {
                    return '<button class="btn btn-outline-success btn-facture" data-fact-id="' + row.numFact + '">Imprimer</button>';
                }
            }
        ]
    });

    $(document).on('click', '.btn-facture', function() {
        var numFact = $(this).data('fact-id');
        window.location.href = 'assets/vendor/alpha/facture.php?numFact=' + numFact;
    });
});
</script>
</body>
</html>
