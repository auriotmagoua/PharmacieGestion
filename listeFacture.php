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
      <h1>Listing des ventes</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.php">Home</a></li>
          <li class="breadcrumb-item active">Listing des ventes</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">
            <!-- <div class="col-lg-2"></div> -->
            <div class="col-lg-12  card">
                <div class="row">
                    <table id="dataTable" class="display table  table-bordered" style="width:100%">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th width="4%">dateVente</th>
                                <th>qteV</th>
                                <th>numFactur</th>
                                <th>Nom Produit</th>
                                <th>Client</th>
                                <th width="24%">Action</th>                                                                          
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

<!-- Afficher le PDF dans un modal -->
<div class="modal fade" id="pdfModal" tabindex="-1" aria-labelledby="pdfModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="pdfModalLabel">FACTURE</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="idU" name="idU" value="<?php echo $idU;?>">
                <iframe id="pdfViewer" style="width: 100%; height: 700px;"></iframe>
            </div>
        </div>
    </div>
</div>

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
                    printButton = '<button class="btn btn-outline-success btn-facture" data-fact-id="' + row.numFact + '">Imprimer</button>';
                    cancelButton = '<button class="btn btn-outline-danger btn-annuler mx-2" data-annuler-id="' + row.numFact  + '">Annuler</button>';
                    console.log(cancelButton);
                    return printButton + cancelButton ;
                }
            }
        ]
    });
    });

    $(document).on('click', '.btn-facture', function() {
    var numFact = $(this).data('fact-id');

    // Envoyer la valeur numFact via AJAX
    $.ajax({
        url: 'assets/vendor/alpha/facture.php', // URL de votre fichier PHP
        type: 'POST', // Méthode HTTP GET
        data: { numFact: numFact }, // Données à envoyer
        success: function(response) {
            // Traitement de la réponse en cas de succès
            // Vous pouvez effectuer des actions supplémentaires ici
            // console.log('Réponse de la requête AJAX :', response);

            $('#pdfViewer').attr('src', 'data:application/pdf;base64,' + response);
                $('#pdfModal').modal('show');
        },
        error: function(xhr, status, error) {
            // Traitement de l'erreur en cas d'échec de la requête AJAX
            console.error('Erreur lors de la requête AJAX :', error);
            // Afficher un message d'erreur à l'utilisateur ou effectuer d'autres actions nécessaires
        }
    });
});

$(document).on('click', '.btn-annuler', function() {
    Swal.fire({
        title: "Es-tu sûr? ",
        text: "Vous ne pourrez pas revenir en arrière !",
        icon: "question",
        showDenyButton: true,
        showCancelButton: true,
        denyButtonText: `Don't save`, 
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#7784489",
        confirmButtonText: "Save"
      }).then((result) => {
        if (result.isConfirmed) {
            var numFact = $(this).data('annuler-id');
            var idU = $('#idU').val();
            $.ajax({
                url: 'annulerVente.php', 
                type: 'POST', 
                data: { 
                    numFact: numFact,
                    idU:idU
                }, 
                success: function(response) {
                    if (response.statusCode == 200) {
                        Swal.fire({
                        icon: 'success',
                        title: 'Succès',
                        text: response.message,
                        confirmButtonText: 'OK',
                        showConfirmButton: true,
                        timer: 3000
                    }).then((result) => {
                        if (result.isConfirmed) {
                        location.reload();
                        }
                    });
                    }else{
                        Swal.fire({
                        icon: "error",
                        title: "Oops...!",
                        // toast:true,
                        text: "Erreur l\'or de lannulation de la facture!",
                        showConfirmButton: true,
                        timer: 3000
                        });
                    }
                },
                error: function(xhr, status, error) {
                    // Traitement de l'erreur en cas d'échec de la requête AJAX
                    console.error('Erreur lors de la requête AJAX :', error);
                    // Afficher un message d'erreur à l'utilisateur ou effectuer d'autres actions nécessaires
                }
            });
        }else if (result.isDenied) {
          Swal.fire("Facture non annuler", "", "info");
          setTimeout(function() {
            Swal.close();
          }, 3000);
        }
    
});
});
</script>
</body>
</html>
