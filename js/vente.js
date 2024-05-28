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
      
      htmlRows += '<td><select type="text" name="productCode[]"  id="productCode_'+count+'" class="form-control selectProduct" autocomplete="off"></select></td>';          
      htmlRows += '<td><input type="number" name="quantity[]" id="quantity_'+count+'" min="1" class="form-control quantity" autocomplete="off"></td>';   		
      htmlRows += '<td><input type="number" name="price[]" id="price_'+count+'" class="form-control price" autocomplete="off" readonly></td>';		 
      htmlRows += '<td><input type="number" name="total[]" id="total_'+count+'" class="form-control total" autocomplete="off" readonly></td>';          
      htmlRows += '</tr>';

      $('#invoiceItem').append(htmlRows);

      $('#productCode_'+count).select2();

      // Effectuer une requête AJAX pour récupérer les données de la base de données
      $.ajax({
        url: 'getProdInv.php', // Remplacez "obtenir_donnees.php" par votre script de récupération de données
        type: 'GET',
        minLength: 1,
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
    $(document).on('input', "[id^=quantity_]", function(){
      calculateTotal();
    });	
    $(document).on('input', "[id^=price_]", function(){
      calculateTotal();
    });	
    $(document).on('input', "#taxRate", function(){		
      calculateTotal();
    });	
    $(document).on('input', "#amountPaid", function(){
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
        var formData = new FormData($("#invoice-form")[0]);
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
              icon: 'success',
              title: 'Succès',
              text: "Enregistrer avec Succès!",
              confirmButtonText: 'OK',
              showConfirmButton: true,
              timer: 3000
            }).then((result) => {
              if (result.isConfirmed) {
                location.reload(); // Recharge la page
              }
          });
            // $("#invoice-form")[0].reset();
            }else{
              Swal.fire({
                icon: "error",
                title: "Oops...!",
                // toast:true,
                text: "Veuillez renseigner les champs!",
                showConfirmButton: true,
                timer: 3000
              });
            }
          },
          error: function(xhr,status,error) {
            console.log('error'+ error);
            toastr.warning('Erreur dans votre requette ajax');
          }
        });
      }else if (result.isDenied) {
        Swal.fire("Donneés non enregistrées", "", "info");
        setTimeout(function() {
          Swal.close();
        }, 3000);
      }
    });
  });



  // chargement des  clients dans le select 2
  $(document).ready(function() {
    $('#idClient').select2();
      // Effectuer une requête AJAX pour récupérer les données de la base de données
    $.ajax({
    url: 'getClient.php', 
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
    },
      });
      

  });

  // chargement des  produits dans le select 2
  $(document).ready(function() {
    $('#productCode_1').select2();
    $.ajax({
    url: 'getProdInv.php', 
    type: 'GET',
    minLength: 1,
    dataType: 'json',
    success: function(data) {
      // Parcourir les données et générer les options de l'élément select
      for (var i = 0; i < data.length; i++) {
        $('#productCode_1').append('<option value="' + data[i].idProd + '">' + data[i].nomProd + '</option>');
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