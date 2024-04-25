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
      <h1>Vendre Produit</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.php">Home</a></li>
          <li class="breadcrumb-item active">Vendre Produit</li>
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
                  <td><select type="text" name="productCode[]"  id="productCode_1" class="form-control" autocomplete="off"></select></td>
                  <td><input type="number" name="quantity[]" id="quantity_1" class="form-control quantity" autocomplete="off"></td>
                  <td><input type="number" name="price[]" id="price_1" class="form-control price" autocomplete="off"></td>
                  <td><input type="number" name="total[]" id="total_1" class="form-control total" autocomplete="off"></td>
                </tr>						
              </table>
            </div>
          </div>
          <div class="row">
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
  <script>
     $(document).ready(function(){
	$(document).on('click', '#checkAll', function() {          	
		$(".itemRow").prop("checked", this.checked);
	});	
	$(document).on('click', '.itemRow', function() {  	
		if ($('.itemRow:checked').length == $('.itemRow').length) {
			$('#checkAll').prop('checked', true);
		} else {
			$('#checkAll').prop('checked', false);
		}
	});  
	var count = $(".itemRow").length;
	$(document).on('click', '#addRows', function() { 
		count++;
		var htmlRows = '';
		htmlRows += '<tr>';
		htmlRows += '<td><input class="itemRow" type="checkbox"></td>';          
    
		htmlRows += '<td><select type="text" name="productCode[]"  id="productCode_'+count+'" class="form-control" autocomplete="off"></select></td>';          
		htmlRows += '<td><input type="number" name="quantity[]" id="quantity_'+count+'" class="form-control quantity" autocomplete="off"></td>';   		
		htmlRows += '<td><input type="number" name="price[]" id="price_'+count+'" class="form-control price" autocomplete="off"></td>';		 
		htmlRows += '<td><input type="number" name="total[]" id="total_'+count+'" class="form-control total" autocomplete="off"></td>';          
		htmlRows += '</tr>';

		$('#invoiceItem').append(htmlRows);

    $('#productCode_'+count).select2();

  // Effectuer une requête AJAX pour récupérer les données de la base de données
  $.ajax({
    url: 'getProdInv.php', // Remplacez "obtenir_donnees.php" par votre script de récupération de données
    type: 'GET',
    minLength: 2,
    // minimumInputLength:1,
    dataType: 'json',
    success: function(data) {
      // Parcourir les données et générer les options de l'élément select
      for (var i = 0; i < data.length; i++) {
        $('#productCode_'+count).append('<option value="' + data[i].idProd + '">' + data[i].nomProd + '</option>');
      }
      $('#productCode_'+count).change(function() {
        // Obtenir le prix unitaire sélectionné
        var selectedProductId = $(this).val();
        var selectedProduct = data.find(function(product) {
          return product.idProd === selectedProductId;
        });

        // Afficher le prix unitaire dans le champ d'entrée
        if (selectedProduct) {
          $('#price_'+count).val(selectedProduct.prixU);
        }
      });
    },
    error: function() {
      alert('Une erreur s\'est produite lors de la récupération des données.');
    }
  });

	}); 

  $(document).on('click', '#removeRows', function(){
  $(".itemRow:checked").each(function() {
    $(this).closest('tr').remove();
  });
  $('#checkAll').prop('checked', false);
  calculateTotal();
	});
  $(document).on('blur', "[id^=quantity_]", function(){
		calculateTotal();
	});	
	$(document).on('blur', "[id^=price_]", function(){
		calculateTotal();
	});	
	$(document).on('blur', "#taxRate", function(){		
		calculateTotal();
	});	
	$(document).on('blur', "#amountPaid", function(){
		var amountPaid = $(this).val();
		var totalAftertax = $('#totalAftertax').val();	
		if(amountPaid && totalAftertax) {
			totalAftertax = totalAftertax-amountPaid;			
			$('#amountDue').val(totalAftertax);
		} else {
			$('#amountDue').val(totalAftertax);
		}	
	});	
  
});


function calculateTotal(){
	var totalAmount = 0; 
	$("[id^='price_']").each(function() {
		var id = $(this).attr('id');
		id = id.replace("price_",'');
		var price = $('#price_'+id).val();
		var quantity  = $('#quantity_'+id).val();
		if(!quantity) {
			quantity = 1;
		}
		var total = price*quantity;
		$('#total_'+id).val(parseFloat(total));
		totalAmount += total;			
	});
	$('#subTotal').val(parseFloat(totalAmount));	
	var taxRate = $("#taxRate").val();
	var subTotal = $('#subTotal').val();	
	if(subTotal) {
		var taxAmount = subTotal*taxRate/100;
		$('#taxAmount').val(taxAmount);
		subTotal = parseFloat(subTotal)+parseFloat(taxAmount);
		$('#totalAftertax').val(subTotal);		
		var amountPaid = $('#amountPaid').val();
		var totalAftertax = $('#totalAftertax').val();	
		if(amountPaid && totalAftertax) {
			totalAftertax = totalAftertax-amountPaid;			
			$('#amountDue').val(totalAftertax);
		} else {		
			$('#amountDue').val(subTotal);
		}
	}
}



        // envoyer les donnees a  save.php pour enregistrement
        $(document).on("click", "#invoice_btn", function (e) {
      e.preventDefault();
      var formData = new FormData($("#invoice-form")[0]);
      // console.log(formData);
      $.ajax({
          data: formData,
          type: "post",
          url: "saveInvoice.php",
          dataType: "json",
          processData: false,
          contentType: false,
          success: function (response) {
            if (response.statusCode == 200) {
              Swal.fire({
              icon: "success",
              title: "Good Job!",
              // toast:true,
              text: "Vente effectuees avec success",
              showConfirmButton: true,
              timer: 3000
            });
            $("#invoice-form")[0].reset();
            } else{
              Swal.fire({
                icon: "error",
                title: "Oops...!",
                // toast:true,
                text: "Erreur l\'or de l\'enregistrement de la vente",
                showConfirmButton: true,
                timer: 3000
              });
            }
          },
          error: function(xhr,status,error) {
            console.log('error'+ error);
            // toastr.warning('Erreur dans votre requette ajax');
          }
      });
  });



    // chargement des  clients dans le select 2
    $(document).ready(function() {
      $('#idClient').select2();
        
      // Effectuer une requête AJAX pour récupérer les données de la base de données
      $.ajax({
        url: 'getClient.php', // Remplacez "obtenir_donnees.php" par votre script de récupération de données
        type: 'GET',
        minLength: 1,
        dataType: 'json',
        success: function(data) {
          // Parcourir les données et générer les options de l'élément select
          for (var i = 0; i < data.length; i++) {
            $('#idClient').append('<option value="' + data[i].idClient + '">' + data[i].nomClient + '</option>');
          }
        },
        error: function() {
          alert('Une erreur s\'est produite lors de la récupération des données.');
        }
      });
    });

        // chargement des  clients dans le select 2
        $(document).ready(function() {
      $('#productCode_1').select2();

      // Effectuer une requête AJAX pour récupérer les données de la base de données
      $.ajax({
        url: 'getProdInv.php', // Remplacez "obtenir_donnees.php" par votre script de récupération de données
        type: 'GET',
        minLength: 1,
        dataType: 'json',
        success: function(data) {
          // Parcourir les données et générer les options de l'élément select
          for (var i = 0; i < data.length; i++) {
            $('#productCode_1').append('<option value="' + data[i].idProd + '">' + data[i].nomProd + '</option>');
            // $('#price_1').val(data[i].prixU );
          }
           // Gérer l'événement de changement de l'option sélectionnée
          $('#productCode_1').change(function() {
            // Obtenir le prix unitaire sélectionné
            var selectedProductId = $(this).val();
            var selectedProduct = data.find(function(product) {
              return product.idProd === selectedProductId;
            });

            // Afficher le prix unitaire dans le champ d'entrée
            if (selectedProduct) {
              $('#price_1').val(selectedProduct.prixU);
            }
          });
        },
        error: function() {
          alert('Une erreur s\'est produite lors de la récupération des données.');
        }
      });
    });
  </script>

</body>

</html>