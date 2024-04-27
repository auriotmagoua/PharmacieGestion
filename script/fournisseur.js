$(document).ready(function() {

    // datatable sever-side
    var table = $('#example').DataTable({
        ajax: 'forms/server_processingF.php',
        processing: true,
        serverSide: true,
        language: {
            search: ' ',
            searchPlaceholder: 'Recherche fournisseur',
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

     //insertion du fournisseur
    $(document).on('submit', '#myform', function(e) {
        e.preventDefault(); // Empêche le comportement par défaut du formulaire

        // Afficher la boîte de dialogue de confirmation
        Swal.fire({
            title: "Are you sure?",
            text: "Voulez vous inserer ce fournisseur?",
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
                    url: "forms/addfournisseur.php",
                    dataType: "json",
                    contentType: false,
                    processData: false,
                    success: function(dataResult) {
                        if (dataResult.statusCode == 200) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success',
                                text: 'fournisseur enregistrés',
                                confirmButtonText: 'OK',
                                showConfirmButton: true,
                            });
                            $('#myform')[0].reset(); // Réinitialise le formulaire
                            $('#exampleModalToggle').modal('hide');
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

    // Événement de clic sur le bouton "Modifier"
    $('#example').on('click', '#edit-button', function() {
        var rowId = $(this).data('id');

        $.ajax({
            data: {id : rowId},
            type: "post",
            url: "forms/getDataFournis.php",
            dataType: "json",
            success: function(response) {
               
                for (var key in response) {
                    if (response.hasOwnProperty(key)) {
                        // console.log(key + ": " + response[key]); // Affiche chaque élément du tableau
                       // Afficher les informations dans le formulaire de modification
                      $('#nomF1').val(response['nomFournis']);
                      $('#villeF1').val(response['villeFournis']);
                      $('#emailF1').val(response['emailFournis']);
                      $('#telF1').val(response['telephoneFournis']);
                  
                      // Stocker l'identifiant dans un champ caché pour l'envoi ultérieur
                      $('#idF1').val(rowId);
                  
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

    // Gérer le clic sur le bouton de soumission du formulaire de modification

    $(document).on('submit', '#editForm', function(e) {
        e.preventDefault(); // Empêche le comportement par défaut du formulaire
        
        // Afficher la boîte de dialogue de confirmation
        Swal.fire({
          title: "Are you sure?",
          text: "Voulez-vous modifier ce fournisseur?",
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
              url: "forms/editFournis.php",
              dataType: "json",
              contentType: false,
              processData: false,
              success: function(dataResult) {
                if (dataResult.statusCode == 200) {
                  Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: 'Modification du fournisseur réussie',
                    confirmButtonText: 'OK',
                    showConfirmButton: true,
                  });
                  $('#editForm')[0].reset(); // Réinitialise le formulaire
                  $('#editModalToggle').modal('hide'); // Masque la fenêtre modale de modification
                  location.reload(); // Recharge la page
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
                    url: "forms/delete.php",
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
                        location.reload(); // Recharge la page
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

});

