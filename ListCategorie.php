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
        <!-- Bouton pour ajouter une catégorie -->
    <button class="btn btn-primary mb-3" id="btn-add-category" data-bs-toggle="modal" data-bs-target="#addCategoryModal">Ajouter Catégorie</button>
    <section class="section dashboard">
        <div class="row">
            <!-- <div class="col-lg-2"></div> -->
            <div class="col-lg-12  card">
                <div class="row">
                    <table id="example" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>IDCategorie</th>
                                <th>nomCategorie</th>
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
<div class="modal fade" id="delete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Delect Categorie</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="modal-body">
            <form class="row g-3 needs-validation" id="myform" novalidate>
            <div class="col-md-12">
                    <label for="nomcategorie_delete" class="form-label">Nom Admin:</label>
                    <input type="text" class="form-control" id="nomcategorie_delete" name="nomcategorie_delete" placeholder="enter une categorie" required>
                    <div class="invalid-feedback">
                    nom categorie requis!
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
</div>
<!--end modal to delete -->

<!-- start modal to update -->
<!-- Modal de mise à jour -->
<div class="modal fade" id="update" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modifier la catégorie</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form class="row g-3 needs-validation" id="update_form" novalidate>
          <div class="col-md-12">
            <label for="nomcategorie_update" class="form-label">Nom de la catégorie:</label>
            <input type="text" class="form-control" id="nomcategorie_update" name="nomcategorie_update" placeholder="Entrez le nom de la catégorie" required>
            <div class="invalid-feedback">Nom de catégorie requis!</div>
          </div>
        
      </div>
      <div class="modal-footer d-flex justify-content-center">
        <div class="col-12">
          <div class="d-flex justify-content-center">
            <button class="btn btn-outline-danger" data-bs-dismiss="modal">Annuler</button>
            <button class="btn btn-outline-primary mx-3" id="btn-update">Modifier</button>
          </div>
        </div>
      </div>
      </form>
    </div>
  </div>
</div>
<!--end modal to update -->


<!-- Modal pour ajouter une catégorie -->
<div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addCategoryModalLabel">Ajouter une catégorie</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="addCategoryForm"  class="row g-3 needs-validation"  novalidate>
          <div class="mb-3">
            <label for="categoryName" class="form-label">Nom de la catégorie</label>
            <input type="text" class="form-control" id="categoryName" name="categoryName" placeholder="Entrez le nom de la catégorie" required>
            <div class="invalid-feedback">Nom de catégorie requis!</div>
          </div>
          
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
        <button type="button" class="btn btn-primary" id="btn-save-category">Enregistrer</button>
      </div>
    </div>
  </div>
</div>
 <!-- fin Modal pour ajouter une catégorie -->
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
$(document).ready(function () {
    // Chargement des données de la base de données lors du chargement de la page
    $.ajax({
        url: 'get_data_cat.php', // Le script PHP pour récupérer les données de la base de données
        type: 'GET',
        success: function (response) {
            // Ajout des éléments récupérés dans le tableau
            $('tbody').html(response);
        },
        error: function (xhr, status, error) {
            console.error('Une erreur est survenue lors du chargement des données.');
        }
    });

    var CategoIdToDelet; // Déclaration de la variable en dehors de la fonction

// Gestion de la suppression d'un élément
$(document).on('click', '.btn-delete', function () {
    var rowData = $(this).closest('tr').find('td'); // Récupérer les données de la ligne sélectionnée
    // Stocker l'ID de la catégorie à supprimer dans la variable CategoIdToDelet
    CategoIdToDelet = $(rowData[0]).text(); // Assurez-vous que l'ID est dans la première colonne
    // Afficher les données de la catégorie dans le champ de la modal "Supprimer"
    $('#nomcategorie_delete').val($(rowData[1]).text()); // Afficher le nom de la catégorie dans le champ de la modal "Supprimer"

    $('#delete').modal('show'); // Afficher le modal "Supprimer"
});

// Gestion de la confirmation de suppression avec SweetAlert
$('#btn-send').click(function (e) {
    e.preventDefault(); // Empêcher le comportement par défaut du bouton

    // Fermer le modal de confirmation
    $('#delete').modal('hide');

    Swal.fire({
        title: 'Êtes-vous sûr?',
        text: "Vous êtes sur le point de supprimer cette catégorie '" + $('#nomcategorie_delete').val() + "'. Cette action est irréversible!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Oui, supprimer!',
        cancelButtonText: 'Annuler'
    }).then((result) => {
        if (result.isConfirmed) {
            // Effectuer une requête AJAX pour supprimer la catégorie avec l'ID spécifié
            $.ajax({
                url: 'delete_cat.php', // Le script PHP pour supprimer la catégorie
                type: 'POST',
                data: { catId: CategoIdToDelet }, // Passer l'ID de la catégorie à supprimer
                success: function (response) {
                    // Actualiser la page ou afficher un message de succès
                    console.log('Catégorie supprimée avec succès.');
                    Swal.fire(
                        'Supprimé!',
                        'La catégorie a été supprimée avec succès.',
                        'success'
                    ).then(() => {
                        location.reload(); // Recharger la page après la suppression
                    });
                },
                error: function (xhr, status, error) {
                    console.error('Une erreur est survenue lors de la suppression de la catégorie.');
                    Swal.fire(
                        'Erreur!',
                        'Une erreur est survenue lors de la suppression de la catégorie.',
                        'error'
                    );
                }
            });
        }
    });
});

// Gestion de la modification d'un élément
$(document).on('click', '.btn-update', function () {
    var rowData = $(this).closest('tr').find('td'); // Récupérer les données de la ligne sélectionnée
    
    // Stocker l'ID de la catégorie à mettre à jour dans la variable CategoIdToUpdate
    var CategoIdToUpdate = $(rowData[0]).text(); // Assurez-vous que l'ID est dans la première colonne
    
    // Afficher les données de la catégorie dans le champ de la modal "Modifier"
    $('#nomcategorie_update').val($(rowData[1]).text()); // Afficher le nom de la catégorie dans le champ de la modal "Modifier"

    // Ajouter un événement pour la soumission du formulaire de modification
    $('#update_form').submit(function (e) {
        e.preventDefault(); // Empêcher le comportement par défaut du formulaire

        // Récupérer les nouvelles données de la catégorie à partir du champ de saisie
        var newCategoryName = $('#nomcategorie_update').val();

        // Fermer le modal "Modifier"
        $('#update').modal('hide');

        // Afficher la boîte de dialogue SweetAlert pour confirmer la modification
        Swal.fire({
            title: 'Êtes-vous sûr?',
            text: "Vous êtes sur le point de modifier cette catégorie en '" + newCategoryName + "'.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Oui, modifier!',
            cancelButtonText: 'Annuler'
        }).then((result) => {
            if (result.isConfirmed) {
                // Effectuer une requête AJAX pour modifier la catégorie
                $.ajax({
                    url: 'update_cat.php', // Le script PHP pour modifier la catégorie
                    type: 'POST',
                    data: { catId: CategoIdToUpdate, newCatName: newCategoryName }, // Passer l'ID de la catégorie et le nouveau nom
                    success: function (response) {
                        // Actualiser la page ou afficher un message de succès
                        console.log('Catégorie modifiée avec succès.');
                        Swal.fire(
                            'Modifié!',
                            'La catégorie a été modifiée avec succès.',
                            'success'
                        ).then(() => {
                            location.reload(); // Recharger la page après la modification
                        });
                    },
                    error: function (xhr, status, error) {
                        console.error('Une erreur est survenue lors de la modification de la catégorie.');
                        Swal.fire(
                            'Erreur!',
                            'Une erreur est survenue lors de la modification de la catégorie.',
                            'error'
                        );
                    }
                });
            }
        });
    });

    $('#update').modal('show'); // Afficher le modal "Modifier"
});

// ajouter un nouvelle categorie
$(document).ready(function () {
    // Traitement du formulaire pour ajouter une catégorie
    $('#btn-save-category').click(function () {
        var categoryName = $('#categoryName').val(); // Récupérer le nom de la catégorie depuis le champ de saisie
        
        // Vérifier si le champ est vide
        if (!categoryName.trim()) {
            Swal.fire(
                'Erreur!',
                'Veuillez entrer le nom de la catégorie.',
                'error'
            );
            return;
        }

        // Demander une confirmation avant d'ajouter la catégorie
        Swal.fire({
            title: 'Êtes-vous sûr?',
            text: "Voulez-vous vraiment ajouter la catégorie '" + categoryName + "'?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Oui, ajouter!',
            cancelButtonText: 'Annuler'
        }).then((result) => {
            if (result.isConfirmed) {
                // Envoyer une requête AJAX pour ajouter la catégorie à la base de données
                $.ajax({
                    url: 'add_category.php', // Chemin vers le script PHP pour ajouter la catégorie
                    type: 'POST',
                    data: { categoryName: categoryName }, // Envoyer le nom de la catégorie
                    success: function (response) {
                        // Afficher une alerte de succès
                        Swal.fire(
                            'Succès!',
                            'La catégorie a été ajoutée avec succès.',
                            'success'
                        ).then(() => {
                            // Actualiser la page pour afficher la nouvelle catégorie
                            location.reload();
                        });
                    },
                    error: function (xhr, status, error) {
                        // Afficher une alerte d'erreur en cas de problème
                        Swal.fire(
                            'Erreur!',
                            'Une erreur est survenue lors de l\'ajout de la catégorie.',
                            'error'
                        );
                    }
                });
            }
        });
    });

    // Validation du formulaire de saisie du nom de la catégorie
    $('#addCategoryForm').submit(function (e) {
        e.preventDefault(); // Empêcher la soumission du formulaire par défaut

        // Récupérer le nom de la catégorie depuis le champ de saisie
        var categoryName = $('#categoryName').val().trim();

        // Vérifier si le champ est vide
        if (!categoryName) {
            // Afficher un message d'erreur si le champ est vide
            $('#categoryName').addClass('is-invalid');
            $('#categoryName').next('.invalid-feedback').text('Veuillez entrer le nom de la catégorie.');
        } else {
            // Soumettre le formulaire si le champ n'est pas vide
            $(this).off('submit').submit();
        }
    });
});

});

</script>


</body>
</html>
