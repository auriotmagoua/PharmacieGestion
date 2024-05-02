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
                <div class="card-body">
                  <h5 class="card-title">Ventes</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart-dash"></i>
                    </div>
                    <div class="ps-3">
                      <h6 id="countVentes"></h6>
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
                      <h6 id="countAppro"></h6>
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
                      <h6 id="countClients"></h6>
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
                      <h6 id="countFournisseurs"></h6>
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
  <script src="script/index.js"></script>
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

  <!-- le js pour les statistiques  -->
  <script src="js/index.js"></script>

  <script>
    $(document).ready(function() {
        let tab = [];
        <?php
        include 'connexiondb.php';
        $conn = connexionMysqli();
        include 'stock.php';
        $sql = "SELECT * from produit where etat='active' order by nomProd";

        $sql = "SELECT * FROM produit";

        $result = $conn->query($sql);
        if ($result) {
          $sum_qteVente = $sum_qteAppro = $qte_stock = 0;
            while ($row = $result->fetch_assoc()) {
                $nomProd = $row['nomProd'];
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
</script>

</body>

</html>