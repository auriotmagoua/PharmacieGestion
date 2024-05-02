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
      <h1>Vendre medicament(s)</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.php">Home</a></li>
          <li class="breadcrumb-item active">Vendre medicament</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    <section class="section">
    <div class="row">
      <!-- <div class="col-lg-2"></div> -->
      <div class="col-lg-12 justify-content-center align-items-center card">
        <form action="" id="invoice-form">
          <div class="row">
            <div class="card-header text-center">
             <div class="row">
                <!-- <div class="col-sm-2"></div> -->
                <div class="col-sm-3 text-start mx-3">
                <p class="h5">choisir client:</p>
                  <select name="idClient" id="idClient" class="form-control mx-3"></select>
                </div>
                <div class="col-sm-6"></div>
                </div>
              </div>
            </div>
            <div class="card-body">
             <div class="row">
                <table class="table table-bordered table-hover" id="invoiceItem">	
                  <tr>
                    <th width="2%"><input id="checkAll" class="formcontrol" type="checkbox"></th>
                    <th width="15%">Produit</th>
                    <th width="15%">Quantite</th>
                    <th width="15%">Prix Unitaire</th>								
                    <th width="15%">Total</th>
                  </tr>							
                  <tr>
                    <td><input class="itemRow" type="checkbox"></td>
                    <td><select type="text" name="productCode[]"  id="productCode_1" class="form-control selectProduct" autocomplete="off"></select></td>
                    <td><input type="number" name="quantity[]" min="1" id="quantity_1" class="form-control quantity" autocomplete="off"></td>
                    <td><input type="number" name="price[]" id="price_1"  class="form-control price" autocomplete="off" readonly></td>
                    <td><input type="number" name="total[]" id="total_1" class="form-control total" autocomplete="off" readonly></td>
                  </tr>						
                </table>
             </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
              <button class="btn btn-danger delete" id="removeRows" type="button">- Delete</button>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-end">
              <button class="btn btn-success" id="addRows" type="button">+ Add More</button>
            </div>
			    </div>
          <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
              <span class="form-inline">
                <div class="form-group">
                  <label>Subtotal: &nbsp;</label>
                  <div class="input-group">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <input value="" type="number" class="form-control" name="subTotal" id="subTotal" placeholder="Subtotal">
                  </div>
                </div>
                <div class="form-group">
                  <label>Taux d'imposition &nbsp;</label>
                  <div class="input-group">
                    <input value="" type="number" class="form-control" name="taxRate" id="taxRate" placeholder="Tax Rate">
                    <span class="input-group-text" id="inputGroupPrepend">%</span>
                  </div>
                </div>
                <div class="form-group">
                  <label>Montant taxe: &nbsp;</label>
                  <div class="input-group">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <input value="" type="number" class="form-control" name="taxAmount" id="taxAmount" placeholder="Tax Amount">
                  </div>
                </div>							
                <div class="form-group">
                  <label>Total: &nbsp;</label>
                  <div class="input-group">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <input value="" type="number" class="form-control" name="totalAftertax" id="totalAftertax" placeholder="Total">
                  </div>
                </div>
                <div class="form-group">
                  <label>Le montant payé: &nbsp;</label>
                  <div class="input-group">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <input value="" type="number" class="form-control" name="amountPaid" id="amountPaid" placeholder="Amount Paid">
                  </div>
                </div>
                <div class="form-group">
                  <label>Montant dû: &nbsp;</label>
                  <div class="input-group">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <input value="" type="number" class="form-control" name="amountDue" id="amountDue" placeholder="Amount Due">
                  </div>
                </div>
              </span>
            </div>
            <div class="col-sm-3"></div>
          </div>
          <div class="row py-4">
            <div class="col-sm-4"></div>
            <input type="hidden" name="type" value="1">
            <div class="col-sm-4">
              <div class="form-group">
                <input data-loading-text="Saving Invoice..." type="submit" name="invoice_btn" id="invoice_btn" value="Save Invoice" class="btn btn-success submit_btn invoice-save-btm">						
              </div>
            </div>
            <div class="col-sm-4"></div>
          </div>
        </form>
      </div>
    </div>

    </section>

  </main><!-- End #main -->

  <?php include "include/footer.php";?>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <!-- <script src="script/client.js"></script> -->
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
  
  <!-- script pour les ventes de produit  -->
  <script src="js/vente.js"></script>
  
  <style>
  .selectProduct {
  width: 200px; /* Définissez la largeur souhaitée pour les éléments select */
  }
  </style>
</body>
</html>