$(document).ready(function() {
    $('#loginForm').submit(function(event) {
        // Empêcher la soumission par défaut du formulaire
        event.preventDefault();

        // Réinitialiser les messages d'erreur
        $('.invalid-feedback').text('');

        // Récupérer les valeurs des champs
        var username = $('#username').val();
        var password = $('#password').val();

        // Vérifier si les champs sont vides
        if (!username || !password) {
            // Afficher un message d'erreur pour les champs vides
            $('#username').next('.invalid-feedback').text('Veuillez remplir tous les champs.');
            return;
        }

        // Envoyer la requête AJAX pour vérifier les identifiants
        $.ajax({
            url: ajaxUrl, // Utiliser la variable ajaxUrl pour le chemin
            method: 'POST',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(response) {
                if (!response.success) {
                    // Afficher un message d'erreur pour les identifiants invalides
                    $('#password').next('.invalid-feedback').text(response.message);
                    $('#password').addClass('is-invalid');
                    $('#username').next('.invalid-feedback').text(response.message);
                    $('#username').addClass('is-invalid');
                } else {
                    // Redirection après une requête AJAX réussie
                    window.location.href = 'index.php';
                }
            },
            error: function(xhr, status, error) {
                console.error('Erreur AJAX:', error);
            }
        });
    });
});
