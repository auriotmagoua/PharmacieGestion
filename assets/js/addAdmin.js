$(document).ready(function() {
    $('#loginForm2').submit(function(event) {
        // Empêcher la soumission par défaut du formulaire
        event.preventDefault();

        // Valider les mots de passe
        addAdmin() ;
    });


    function addAdmin() {
        var name = $('#name').val().trim();
        var login = $('#login').val().trim();
        var password = $('#password').val().trim();
        var confirmPassword = $('#confirmPassword').val().trim(); 
    
        // Vérifier si tous les champs obligatoires sont remplis
        if (name === '' || login === '' || password === '' || confirmPassword === '') {
            Swal.fire('Erreur', 'Veuillez remplir tous les champs obligatoires', 'error');
            return;
        }
    
        // Vérifier si les mots de passe correspondent
        if (password !== confirmPassword) {
            $('#passwordMatch').show(); // Afficher un message d'erreur si les mots de passe ne correspondent pas
            return;
        }
    
        // Hacher le mot de passe avec MD5 (à des fins de démonstration)
        // var hashedPassword = md5(password); // Assurez-vous d'avoir inclus la bibliothèque MD5
    
        // Demander confirmation avant d'ajouter l'administrateur
        Swal.fire({
            title: 'Êtes-vous sûr de vouloir ajouter cet admin ?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Oui',
            cancelButtonText: 'Annuler'
        }).then((result) => {
            if (result.isConfirmed) {
                // Envoyer la requête AJAX pour ajouter l'administrateur
                $.ajax({
                    url: 'addAdmin.php',
                    type: 'POST',
                    data: { name: name, login: login, password: password },
                    success: function(response) {
                        Swal.fire('Succès', response, 'success').then((result) => {
                            window.location.href = 'listeAdmin.php'; // Redirection vers la liste des administrateurs après succès
                        });
                    },
                    error: function(xhr, status, error) {
                        Swal.fire('Erreur', 'Une erreur est survenue', 'error');
                    }
                });
            }
        });
    }
    
});
