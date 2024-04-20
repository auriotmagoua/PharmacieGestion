$(document).ready(function() {
    // Tableau pour stocker les produits sélectionnés avec leur quantité
    var cartItems = [];
    var totalPrice = 0;

    // Récupérer et afficher les produits depuis la base de données dans Select2
    function loadProducts() {
        $.ajax({
            url: 'get_products.php',
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                $('#produit').select2({
                    data: response.map(function(product) {
                        return { id: product.idProd, text: product.nomProd };
                    })
                });
            },
            error: function() {
                alert('Erreur lors de la récupération des produits.');
            }
        });
    }

    // Chargement initial des produits
    loadProducts();

    // Ajouter un produit au panier
    $('#addToCartBtn').on('click', function(event) {
        event.preventDefault(); // Empêcher le comportement par défaut du formulaire

        var productId = $('#produit').val();

        // Exemple d'appel AJAX pour récupérer les détails du produit depuis la base de données
        $.ajax({
            url: 'get_product_details.php',
            type: 'POST',
            data: { productId: productId },
            dataType: 'json',
            success: function(response) {
                cartItems.push({
                    id: response.idProd,
                    name: response.nomProd,
                    price: response.prixU,
                    quantity: 1
                });
                updateCart();
            },
            error: function() {
                alert('Erreur lors de la récupération des détails du produit.');
            }
        });
    });

    // Retirer un produit du panier
    $(document).on('click', '.removeFromCart', function() {
        var itemId = $(this).data('id');
        console.log('ID du produit à retirer :', itemId); // Ajout de console.log() pour débogage
        cartItems = cartItems.filter(item => item.id !== itemId);
        console.log('Panier après retrait :', cartItems); // Ajout de console.log() pour débogage
        updateCart();
    });

    // Fonction pour mettre à jour le panier, la quantité totale et le prix total
    function updateCart() {
        $('#cartItems').empty();
        totalPrice = 0;
        var totalQuantity = 0; // Ajout de la variable pour stocker la quantité totale

        cartItems.forEach(function(item) {
            var price = item.price * item.quantity;
            totalPrice += price;
            totalQuantity += item.quantity; // Ajout de la quantité de chaque produit au total
            $('#cartItems').append('<div>' + item.name + ' - ' + item.price + ' FCFA <span class="badge badge-primary">' + item.quantity + '</span> '+ ' </div>');
        });

        $('#totalPriceInput').val(Math.floor(totalPrice) + ' FCFA');
        $('#quantite').val(totalQuantity); // Mettre à jour le champ de quantité avec la quantité totale
    }
});
