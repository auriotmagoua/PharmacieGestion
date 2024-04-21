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
                // var deleteButton = '<button class="btn btn-outline-danger me-2" id="delete-button" data-id="' + row[0] + '">Supprimer</button>';
                return editButton;
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
                      $('#numLot').val(response['numLot']);
                      $('#image-preview').attr('src', response['imageProd']);
                      $('#datePerem').val(response['datePerem']);
                      $('#qteDispo').val(response['qteDispo']);
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



