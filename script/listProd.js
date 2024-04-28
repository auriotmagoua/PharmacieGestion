$(document).ready(function() {

    // datatable sever-side
    var table = $('#example').DataTable({
        ajax: 'server_processing.php',
        processing: true,
        serverSide: true,
        language: {
            search: ' ',
            searchPlaceholder: 'Rechercher un produit',
        },
        columnDefs: [{
            targets: -1, // Dernière colonne (colonne "Action")
            render: function(data, type, row, meta) {
                var editButton = '<button class="btn btn-outline-success me-2" id="edit-button" data-id="' + row[0] + '">Modifier</button>';
                var deleteButton = '<button class="btn btn-outline-danger me-2" id="delete-button" data-id="' + row[0] + '">Supprimer</button>';
                return deleteButton + editButton;
            }
        }]
    });


    // Événement de clic sur le bouton "Modifier"
    $('#example').on('click', '#edit-button', function() {
        var rowId = $(this).data('id');

        $.ajax({
            data: {id : rowId},
            type: "post",
            url: "getProd.php",
            dataType: "json",
            success: function(response) {
                for (var key in response) {
                    if (response.hasOwnProperty(key)) {
                        // console.log(key + ": " + response[key]); // Affiche chaque élément du tableau
                       // Afficher les informations dans le formulaire de modification
                      $('#nomProd').val(response['nomProd']);
                      $('#image-preview').attr('src', response['imageProd']);
                    //   $('#imageProd').val(response['imageProd']);
                      $('#prixU').val(response['prixU']);
                      $('#idCategorie').val(response['idCategorie']);
                      // Stocker l'identifiant dans un champ caché pour l'envoi ultérieur
                      $('#idProd').val(rowId);
                  
                      // Afficher la fenêtre modale de modification
                      $('#editModalToggle').modal('show');
                    }
                }   
            },
            error: function(xhr, status, error) {
                // Gérer les erreurs de la requête AJAX
                console.log(error);
            }
        });
        
    });


    const imageInput = document.getElementById('imageProd');
    const imagePreview = document.getElementById('image-preview');
    imageInput.addEventListener('change', function() {
      const file = this.files[0];
      const reader = new FileReader();

      reader.onload = function(e) {
          imagePreview.src = e.target.result;
      }

      reader.readAsDataURL(file);
    });


    const imageInput1 = document.getElementById('imageProd1');
    const imagePreview1 = document.getElementById('image-preview1');
    imageInput1.addEventListener('change', function() {
      const file = this.files[0];
      const reader = new FileReader();

      reader.onload = function(e) {
          imagePreview1.src = e.target.result;
      }

      reader.readAsDataURL(file);
    });


    $(document).on('submit', '#editForm', function(e) {
        e.preventDefault(); // Empêche le comportement par défaut du formulaire
        
        // Afficher la boîte de dialogue de confirmation
        Swal.fire({
          title: "Are you sure?",
          text: "Voulez-vous modifier ce client?",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes",
          cancelButtonText: "No"
        }).then((result) => {
          if (result.isConfirmed) {
            var formData = new FormData($(this)[0]);
            
            $.ajax({
              data: formData,
              type: "post",
              url: "editProd.php",
              dataType: "json",
              contentType: false,
              processData: false,
              success: function(dataResult) {
                if (dataResult.statusCode == 200) {
                  Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: 'Modification du produit réussie',
                    confirmButtonText: 'OK',
                    showConfirmButton: true,
                  });
                  $('#editForm')[0].reset(); // Réinitialise le formulaire
                  location.reload(); // Recharge la page
                  $('#editModalToggle').modal('hide'); // Masque la fenêtre modale de modification
                } else if (dataResult.statusCode == 500) {
                  Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: dataResult.message
                  });
                }
              },
              error: function(xhr, textStatus, errorThrown) {
                Swal.fire({
                  icon: 'error',
                  title: 'Error',
                  text: 'Erreur lors de la requête AJAX : ' + textStatus
                });
              }
            });
          }
        });
      });

    
});

 // Gérer le clic sur le bouton de suppression
 $('#example').on('click', '#delete-button', function() {

    // Afficher la boîte de dialogue de confirmation
    Swal.fire({
        title: "Are you sure?",
        text: "Voulez-vous supprimer ce fournisseur?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes",
        cancelButtonText: "No"
    }).then((result) => {
        if (result.isConfirmed) {
            var rowId = $(this).data('id'); // recuperer l'identifiant

        
            $.ajax({
                data: {id : rowId},
                type: "post",
                url: "deleteProd.php",
                dataType: "json",
                success: function(dataResult) {
                if (dataResult.statusCode == 200) {
                    Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: 'Suppression du fournisseur réussie',
                    confirmButtonText: 'OK',
                    showConfirmButton: true,
                    });
                } else if (dataResult.statusCode == 500) {
                    Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: dataResult.message
                    });
                }
                },
                error: function(xhr, textStatus, errorThrown) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Erreur lors de la requête AJAX : ' + errorThrown
                });
                }
            });
        }
    });
        
});

  // envoyer les donnees a  save.php pour enregistrement
  $(document).on("click", "#btn-save", function (e) {
    e.preventDefault();
    var formData = new FormData($("#myform")[0]);
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
        $.ajax({
        data: formData,
        type: "post",
        url: "saveProd.php",
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
          toastr.warning('Erreur dans votre requette ajax');
        }
      });
    }
  });
}); 

  // chargement des  categories dans le select 2
  $(document).ready(function() {
    $('#categorie1').select2();

    // Effectuer une requête AJAX pour récupérer les données de la base de données
    $.ajax({
        url: 'getCategorie.php', // Remplacez "obtenir_donnees.php" par votre script de récupération de données
        type: 'GET',
        minLength: 1,
        dataType: 'json',
        success: function(data) {
            // Parcourir les données et générer les options de l'élément select
            for (var i = 0; i < data.length; i++) {
                $('#categorie1').append('<option value="' + data[i].idCategorie + '">' + data[i].nomCategorie + '</option>');
            }
        },
        error: function() {
            alert('Une erreur s\'est produite lors de la récupération des données.');
        }
    });
  });

  $('#ajoutProd').on('shown.bs.modal', function() {
    $('#categorie1').select2();
});
// $('#categorie1').select2({
//   dropdownParent: $('#votreModal')
// });
