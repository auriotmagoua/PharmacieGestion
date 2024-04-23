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
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Approvisionnement</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

      <!-- Sales Card -->
        <div class="card info-card sales-card">
            <?php //include 'forms/Invoice.php'; ?>
            <script src="script/invoice.js"></script>
            <?php //include('inc/container.php');?>
            <div class="container content-invoice"><br><br>
                <form action="" id="invoice-form" method="post" class="invoice-form" role="form" novalidate=""> 
                    <div class="load-animate animated fadeInUp">
                        <input id="currency" type="hidden" value="$">
                        <div class="row">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <h3>From,</h3>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="supplierName" id="supplierName" placeholder="supplier Name" autocomplete="on">
                                </div><br>
                            </div>      		
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 pull-right">
                                <h3>To,</h3>
                                <p>this pharmacy</p>

                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 pull-right">
                                <button class="btn btn-primary" id="submit" type="submit">Enregistrer les produits</button>
                            </div>
                        </div>
                        <div class="row"><br>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <table class="table table-bordered table-hover" id="invoiceItem">	
                                    <tr>
                                        <th width="2%"><input id="checkAll" class="formcontrol" type="checkbox"></th>
                                        <!-- <th width="15%">Item No</th> -->
                                        <th width="38%">Nom du produit</th>
                                        <th width="15%">Quantite</th>
                                        <th width="15%">Prix unitaire</th>								
                                        <th width="15%">Total</th>
                                    </tr>							
                                    <tr>
                                        <td><input class="itemRow" type="checkbox"></td>
                                        <!-- <td><input type="text" name="productCode[]" id="productCode_1" class="form-control" autocomplete="off"></td> -->
                                        <td><input type="text" name="productName[]" id="productName_1" class="form-control" autocomplete="off"></td>			
                                        <td><input type="number" name="quantity[]" id="quantity_1" class="form-control quantity" autocomplete="off"></td>
                                        <td><input type="number" name="price[]" id="price_1" class="form-control price" autocomplete="off"></td>
                                        <td><input type="number" name="total[]" id="total_1" class="form-control total" autocomplete="off"></td>
                                    </tr>						
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                <button class="btn btn-danger delete" id="removeRows" type="button">- Delete</button>
                                <button class="btn btn-success" id="addRows" type="button">+ Add More</button>
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
                                            <input value="" type="number" class="form-control" name="subTotal" id="subTotal" placeholder="Subtotal">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Tax Rate: &nbsp;</label>
                                        <div class="input-group">
                                            <input value="" type="number" class="form-control" name="taxRate" id="taxRate" placeholder="Tax Rate">
                                            <div class="input-group-text">%</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Tax Amount: &nbsp;</label>
                                        <div class="input-group">
                                            <div class="input-group-text">$</div>
                                            <input value="" type="number" class="form-control" name="taxAmount" id="taxAmount" placeholder="Tax Amount">
                                        </div>
                                    </div>							
                                    <div class="form-group">
                                        <label>Total: &nbsp;</label>
                                        <div class="input-group">
                                            <div class="input-group-text">$</div>
                                            <input value="" type="number" class="form-control" name="totalAftertax" id="totalAftertax" placeholder="Total">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Amount Paid: &nbsp;</label>
                                        <div class="input-group">
                                            <div class="input-group-text">$</div>
                                            <input value="" type="number" class="form-control" name="amountPaid" id="amountPaid" placeholder="Amount Paid">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Amount Due: &nbsp;</label>
                                        <div class="input-group">
                                            <div class="input-group-text">$</div>
                                            <input value="" type="number" class="form-control" name="amountDue" id="amountDue" placeholder="Amount Due">
                                        </div>
                                    </div>
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