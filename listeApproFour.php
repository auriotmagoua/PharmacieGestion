<!DOCTYPE html>
<html lang="en">

 
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <title>reporting</title>
    <style>
        .card {
            padding: 20px; /* Réduire le padding pour réduire l'espace à l'intérieur de la carte */
            width: 600px; /* Définir une largeur fixe pour la carte */
            margin: 100px auto; /* Centrer la carte horizontalement */
        }

        h1, h2 {
            text-align: center;
        }

        h1 {
            color: green;
        }
    </style>
     <!-- Lien de non connection -->
     <?php include "tet.php"?>



<?php include "include/header.php"?>
</head>

<body>
<!-- navbar --></center>
<?php include "include/navbar.php"?>

<!-- sidebar -->
<?php include "include/sidebar.php"?>
<div class="card">
    <h2>Approvisionnement Fournisseur </h2>
    <form id="searchForm" method="POST">
        <div class="form-group">
            <label for="dateD">Date debut</label>
            <input type="date" class="form-control" name="dateD" id="dateD" required>
        </div>
        <div class="form-group">
            <label for="dateF">Date de fin</label>
            <input type="date" class="form-control" name="dateF" id="dateF" required>
        </div>
        <div class="form-group">
            <label for="select-autocomplete">Fournisseur</label><br>
            <select class="form-select" id="select-autocomplete" name="select-autocomplete">
             </select>
            
        </div>
        <button type="submit" class="btn btn-primary" id="submitButton"><i class="fa fa-print"></i> PRINT</button>
    </form>
</div>

<!-- Afficher le PDF dans un modal -->
<div class="modal fade" id="pdfModal" tabindex="-1" aria-labelledby="pdfModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="pdfModalLabel">Fichier PDF</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <iframe id="pdfViewer" style="width: 100%; height: 600px;"></iframe>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

   
    <script src="assets/vendor/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="libs/select2/dist/js/select2.min.js"></script>
<script src="listAppFou.js"></script>
<script>
    $(document).ready(function () {
    // Soumettre le formulaire lors du clic sur le bouton PRINT
    $('#submitButton').click(function () {
        $('#searchForm').submit();
    });

    // Afficher le PDF dans le modal après soumission du formulaire
    $('#searchForm').submit(function (e) {
        e.preventDefault(); // Empêcher le formulaire de soumettre normalement
        $.ajax({
            type: 'POST',
            url: 'fpdfAppFou.php',
            data: $(this).serialize(),
            success: function (response) {
                // Afficher le PDF dans le modal
                $('#pdfViewer').attr('src', 'data:application/pdf;base64,' + response);
                $('#pdfModal').modal('show');
            },
            error: function(xhr, status, error) {
                // Gérer les erreurs AJAX
                console.error(xhr.responseText);
                alert('Une erreur est survenue lors de la récupération du PDF.');
            }
        });
    });
});

</script>
</body>
</html>
