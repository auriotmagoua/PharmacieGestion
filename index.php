<!DOCTYPE html>
<html lang="en">
   <!-- Lien de non connection -->
<?php include "tet.php"?>



<?php include "include/header.php"?>

<body>
<!-- navbar -->
<?php include "include/navbar.php"?>

<!-- sidebar -->
<?php include "include/sidebar.php"?>


<?php
    include 'connexiondb.php';
    $conn = connexionMysqli();
    include 'stock.php';
    include 'stock.php';
  ?>

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

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card sales-card">

                <!-- <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div> -->

                <div class="card-body">
                  <h5 class="card-title">Ventes</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart-dash"></i>
                    </div>
                    <div class="ps-3">
                      <h6><span id="countVentes"></span></h6>
                      <!-- <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span> -->

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card revenue-card">
                <div class="card-body">
                  <h5 class="card-title">Approv</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart-plus"></i>
                    </div>
                    <div class="ps-3">
                      <h6><?php $sql = "SELECT COUNT(*) AS total_approv FROM approvisionnement"; $result = $conn->query($sql); if ($result) { $row = $result->fetch_assoc(); $totalClients = $row['total_approv']; echo $totalClients; $result->free(); } ?></h6>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card customers-card">
                <div class="card-body">
                  <h5 class="card-title">Clients </h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6><?php $sql = "SELECT COUNT(*) AS total_clients FROM client"; $result = $conn->query($sql); if ($result) { $row = $result->fetch_assoc(); $totalClients = $row['total_clients']; echo $totalClients; $result->free(); } ?></h6>

                    </div>
                  </div>

                </div>
              </div>
            </div><!-- End Revenue Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card customers-card">
                <div class="card-body">
                  <h5 class="card-title">Fournisseurs</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6><?php $sql = "SELECT COUNT(*) AS total_fournisseur FROM fournisseur"; $result = $conn->query($sql); if ($result) { $row = $result->fetch_assoc(); $totalClients = $row['total_fournisseur']; echo $totalClients; $result->free(); } ?></h6>

                    </div>
                  </div>

                </div>
              </div>
            </div><!-- End Revenue Card -->

            <!-- Reports -->
           
            <!-- <div class="col-4"> -->
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Quantité des produits</h5>

                  <table id="example" class="display nowrap" style="width:100%">
                    <thead>
                      <tr>  
                        <th>Nom du produit</th>
                        <th>Quantité Approvisionnée</th>
                        <th>Quantité vendue</th>
                        <th>Quantité en stock</th>
                      </tr>
                    </thead>
                </table>

                </div>
              </div>
              <div class="card">
                <div class="card-body" >
                  <h5 class="card-title">Statistiques des medicaments vendus par mois</h5>
                  <canvas id="barChart" style="max-height: 400px;"></canvas>
                </div>
              </div>
          </div>
        </div><!-- End Left side columns -->

        
      </div>
    </section>

  </main><!-- End #main -->
  <!-- ======= Footer ======= -->
  <?php require "include/footer.php"?>
  
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <!-- <script src="script/index.js"></script> -->
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
<!-- Assurez-vous d'inclure jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
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
</script>
  <script>
    $(document).ready(function() {
        let tab = [];
        <?php
        // include 'connexiondb.php';x  
        // $conn = connexionMysqli();
        $sql = "SELECT * from produit where etat='active' order by nomProd";

        $sql = "SELECT * FROM produit";

        $result = $conn->query($sql);
        if ($result) {
          $sum_qteVente = $sum_qteAppro = $qte_stock = 0;
            while ($row = $result->fetch_assoc()) {
                $nomProd = $row['nomProd'];
                $sum_qteAppro = getApprovisionnemement($row['idProd']);
                $sum_qteVente = getVente($row['idProd']);
                $qte_stock = getStock($row['idProd']);
                echo "data.push(['$nomProd', $sum_qteAppro, $sum_qteVente, $qte_stock]);";
                $sum_qteAppro = getApprovisionnement($row['idProd']);
                $sum_qteVente = getVente($row['idProd']);
                $qte_stock = getstock($row['idProd']);
                echo "tab.push(['$nomProd', $sum_qteAppro, $sum_qteVente, $qte_stock]);";
            }
            $result->free();
        } else {
            echo "Erreur lors de l'exécution de la requête : " . $conn->error;
        }
        ?>
        new DataTable('#example', {
            data: tab,
            columns: [
                { title: 'Nom du produit' },
                { title: 'Quantité Approvisionnée' },
                { title: 'Quantité vendue' },
                { title: 'Quantité en stock' }
            ],
            scrollCollapse: true,
            scroller: true,
            scrollY: 200
        });
    });

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
</script>

</body>

</html>