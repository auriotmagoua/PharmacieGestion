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
      <h1>Approvisionnement</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.php">Home</a></li>
          <li class="breadcrumb-item active">Approvisionnement</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

      <!-- Sales Card -->
        <div class="card info-card sales-card">
            <?php //include 'forms/Invoice.php'; ?>
            <?php //include('inc/container.php');?>
            <div class="container content-invoice"><br><br>
                <form action="" id="invoice-form" method="post" class="invoice-form" role="form" novalidate=""> 
                    <div class="load-animate animated fadeInUp">
                        <input id="currency" type="hidden" value="$">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <h3>De,</h3>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="supplierName" id="supplierName" placeholder="Nom du fournisseur" autocomplete="on"><br>
                                    <input type="text" name="numBL" id="numBL" class="form-control" placeholder="No BL">
                                </div><br>
                            </div>      		
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 pull-right">
                                <h3>À,</h3>
                                <p>cette pharmacie</p>

                            </div>
                           
                        </div>
                        <div class="row"><br>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <table class="table table-bordered table-hover" id="invoiceItem">	
                                    <tr>
                                        <th width="2%"><input id="checkAll" class="formcontrol" type="checkbox"></th>
                                        <!-- <th width="15%">No BL</th> -->
                                        <th width="38%">Nom du produit</th>
                                        <th width="15%">Quantite</th>
                                        <th width="15%">Prix unitaire</th>								
                                        <th width="15%">Total</th>
                                    </tr>							
                                    <tr>
                                        <td><input class="itemRow" type="checkbox"></td>
                                        <!-- <td><input type="text" name="productCode[]" id="productCode_1" class="form-control" autocomplete="off"></td> -->
                                        <td><select type="text" name="productName[]" id="productName_1" class="form-control" autocomplete="off"></select></td>
                                        <td><input type="number" name="quantity[]" id="quantity_1" class="form-control quantity" autocomplete="off"></td>
                                        <td><input type="number" name="price[]" id="price_1" class="form-control price" autocomplete="off"></td>
                                        <td><input type="number" name="total[]" id="total_1" class="form-control total" autocomplete="off"></td>
                                    </tr>						
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <button class="btn btn-danger delete" id="removeRows" type="button">- Supprimer</button>
                                <button class="btn btn-success" id="addRows" type="button">+ Ajouter plus</button>
                            </div>
                            <br>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <span class="form-inline">
                                    <div class="form-group">
                                        <label>Somme total: &nbsp;</label>
                                        <div class="input-group">
                                            <div class="input-group-text">$</div>
                                            <input value="" type="number" class="form-control" name="subTotal" id="subTotal" placeholder="Somme total">
                                        </div>
                                    </div>
                                    <br><br>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pull-right">
                                            <center><button class="btn btn-primary" id="btn-submit" type="submit">Enregistrer produit(s)</button></center>
                                        </div>
                                    </div><br><br>
                                </span>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"></div>
                        </div>
                        <div class="clearfix"></div>		      	
                    </div>
                </form>			
            </div>
            </div>	

        </div><!-- End Sales Card -->

      </div>
    </section>

  </main><!-- End #main -->


    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="libs/select2/dist/js/select2.min.js"></script>
    <script src="script/invoice.js"></script>
    <script>
        $(document).ready(function() {
            $("#supplierName").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: "forms/scriptComplete.php",
                        data: {
                            term: request.term
                        },
                        dataType: "json",
                        success: function(data) {
                            response(data);
                        }
                    });
                },
                minLength: 1 
            });
            
            $("#productName_1").select2({
                ajax: {
                    url: 'forms/scriptCompleteProduct.php', 
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            search: params.term, 
                            page: params.page
                        };
                    },
                    processResults: function (data, params) {
                        params.page = params.page || 1;

                        return {
                            results: data,
                            pagination: {
                                more: (params.page * 30) < data.total_count 
                            }
                        };
                    },
                    cache: true
                },
                escapeMarkup: function (markup) {
                    return markup;
                },
                minimumInputLength: 1,
                templateResult: formatData,
                templateSelection: formatData
            });

            function formatData(data) {
                if (data.loading) {
                    return data.text;
                }

                var markup = "<div>" + data.text + "</div>";

                return markup;
            }
        });

        $(document).on('click', '#btn-submit', function(e) {
            e.preventDefault();
            if ($('#supplierName').val() === '' && $('#numBL').val() === '' && $('#quantity_1').val() === '' && $('#price_1').val() === ''){
                toastr.error('Veuillez renseigner tout les champs.');

            }else{

            // Afficher la boîte de dialogue de confirmation
            Swal.fire({
                title: "Are you sure?",
                text: "Voulez-vous enregistrer ce(s) produit(s)?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes",
                cancelButtonText: "No"
            }).then((result) => {
                if (result.isConfirmed) {
                    // Récupérer les données du formulaire
                    var formData = new FormData($('#invoice-form')[0]);
                    // console.log(formData)
                    // Envoyer les données au script PHP via AJAX
                    $.ajax({
                        url: "forms/Invoice.php",
                        data: formData,
                        type: "post",
                        dataType: "json",
                        contentType: false,
                        processData: false,
                        success: function(response) {
                            // Afficher le message de succès ou gérer d'autres actions si nécessaire
                            // alert("Données envoyées avec succès !");
                            if (response.statusCode == 200) {
                                Swal.fire({
                                icon: 'success',
                                title: 'Success',
                                text: response.message,
                                confirmButtonText: 'OK',
                                showConfirmButton: true,
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        location.reload(); // Recharge la page
                                    }
                                });
                            }
                        },
                        error: function(xhr, status, error) {
                            // Gérer les erreurs de requête AJAX
                            toastr.error('Veuillez renseigner tout les champs.');
                        }
                    });
                }
            });
        }

                
        });
    </script>

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