$(document).ready(function() {
    $("#select-autocomplete2").select2({
        ajax: {
          url: "listuser.php",
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