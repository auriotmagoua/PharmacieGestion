document.addEventListener("DOMContentLoaded", () => {
    // Effectuer une requête AJAX pour obtenir les données de la base de données
    $.ajax({
      method: "GET",
      url: "getChartData.php", // Remplacez par le chemin vers votre script PHP pour récupérer les données
      dataType: "json",
      success: function(response) {
        // Récupérer les données de la réponse JSON
        const labels = response.labels;
        const data = response.data;
  
        // Créer le graphique à barres avec les données
        new Chart(document.querySelector('#barChart'), {
          type: 'bar',
          data: {
            labels: labels,
            datasets: [{
              label: 'Bar Chart',
              data: data,
              backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 205, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(201, 203, 207, 0.2)'
              ],
              borderColor: [
                'rgb(255, 99, 132)',
                'rgb(255, 159, 64)',
                'rgb(255, 205, 86)',
                'rgb(75, 192, 192)',
                'rgb(54, 162, 235)',
                'rgb(153, 102, 255)',
                'rgb(201, 203, 207)'
              ],
              borderWidth: 1
            }]
          },
          options: {
            scales: {
              y: {
                beginAtZero: true
              }
            }
          }
        });
      },
      error: function() {
        // Gérer les erreurs de la requête AJAX
      }
    });
  });
  
  $(document).ready(function() {
    $.ajax({
      method: "get",
      url: "getStat.php",
      dataType: "json",
      success: function(response) {
        $('#countVentes').text(response.countVentes);
        $('#countAppro').text(response.countAppro);
        $('#countClients').text(response.countClients);
        $('#countFournisseurs').text(response.countFournisseurs);
      },
      error: function() {
        // Gérez les erreurs ici
      }
    });
  });