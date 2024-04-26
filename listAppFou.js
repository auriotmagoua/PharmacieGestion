$(document).ready(function() {
    $("#select-autocomplete").select2({
      ajax: {
        url: "listAppFou.php",
        dataType: "json",
        delay: 250,
        data: function(params) {
          return {
            term: params.term
          };
        },
        processResults: function(data) {
          return {
            results: data
          };
        },
        cache: true
      },
      minimumInputLength: 2
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



  // enregistrer produit

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