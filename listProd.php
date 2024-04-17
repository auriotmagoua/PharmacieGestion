<!DOCTYPE html>
<html lang="en">

<?php include "include/header.php"?>
  <!-- datatable link -->
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"> -->
  <!-- <link rel="stylesheet" href="https://cdn.datatables.net/2.0.4/css/dataTables.bootstrap5.css"> -->
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script> -->
  <script src="https://cdn.datatables.net/2.0.4/js/dataTables.js"></script>
  <script src="https://cdn.datatables.net/2.0.4/js/dataTables.bootstrap5.js"></script>

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
            <!-- <div class="col-lg-2"></div> -->
            <div class="col-lg-12  card">
                <div class="row">
                    <table id="example" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>nomProd</th>
                                <!-- <th>Numlot</th> -->
                                <th>datePerem</th>
                                <th>QteDispo</th>
                                <th>prixU</th>
                                <th>fourni</th>
                                <th>categorie</th>
                                <th>Action</th>                                                                                                                                                                                                                                                                                                                                      
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Tiger Nixon</td>
                                <td>System Architect</td>
                                <td>Edinburgh</td>
                                <td>61</td>
                                <td>2011-04-25</td>
                                <td>$320,800</td>
                                <td>
                                     <button class="btn btn-outline-primary" type="reset" data-bs-toggle="modal" data-bs-target="#edit">edit</button>
                                     <button class="btn btn-outline-success" type="submit" data-bs-toggle="modal" data-bs-target="#delete" id="btn-send">delete</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Garrett Winters</td>
                                <td>Accountant</td>
                                <td>Tokyo</td>
                                <td>63</td>
                                <td>2011-07-25</td>
                                <td>$170,750</td>
                                <td>
                                     <button class="btn btn-outline-primary" type="reset">edit</button>
                                     <button class="btn btn-outline-success" type="submit" id="btn-send">delete</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Ashton Cox</td>
                                <td>Junior Technical Author</td>
                                <td>San Francisco</td>
                                <td>66</td>
                                <td>2009-01-12</td>
                                <td>$86,000</td>
                                <td>
                                     <button class="btn btn-outline-primary" type="reset">edit</button>
                                     <button class="btn btn-outline-success" type="submit" id="btn-send">delete</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
  </main><!-- End #main -->


<!--start modal to edit -->
<div class="modal fade" id="edit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Editer Produit</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="modal-body">
            <form class="row g-3 needs-validation" id="myform" novalidate>
                <div class="col-md-12">
                    <label for="nomProd" class="form-label">Nom produit:</label>
                    <input type="text" class="form-control" id="nomProd" name="nomProd" placeholder="enter un nom" required>
                    <div class="invalid-feedback">
                    nom produit requis!
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="numLot" class="form-label">Numero lot:</label>
                    <input type="number" class="form-control" id="numLot" name="numLot" placeholder="" required>
                    <div class="invalid-feedback">
                    numero de lot requis
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="datePerem" class="form-label">Date peremption</label>
                    <div class="input-group has-validation">
                    <input type="date" class="form-control" id="datePerem" name="datePerem" placeholder="" aria-describedby="inputGroupPrepend" required>
                    <div class="invalid-feedback">
                        date peremption requise!
                    </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="qteProd" class="form-label">Quantite Disponible</label>
                    <input type="number" class="form-control" id="qteProd" name="qteProd" placeholder="" required>
                    <div class="invalid-feedback">
                    quantite de produit requise!
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="prixU" class="form-label">Prix unitaire</label>
                    <input type="number" class="form-control" id="prixU" name="prixU" placeholder="" required>
                    <div class="invalid-feedback">
                    prix unitaire requis!
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="fournisseur" class="form-label">Fournisseur</label>
                    <select type="text" class="form-control" id="fournisseur" name="fournisseur" placeholder="" required></select>
                    <div class="invalid-feedback">
                    fournisseur requis!
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="categoris" class="form-label">Categorie</label>
                    <select type="text" class="form-control" id="categorie" name="categorie" placeholder="" required></select>
                    <div class="invalid-feedback">
                    categoris requise!
                    </div>
                </div>
               
            
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <div class="col-12">
                    <div class="d-flex justify-content-center">
                    <button class="btn btn-outline-danger" data-bs-dismiss="modal">cancel</button>
                    <button class="btn btn-outline-primary mx-3" type="submit" id="btn-send">Modifier</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
  </div>
</div>

  <!--end modal to edit -->



  <!-- start modal to delete -->
<div class="modal fade" id="delete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Editer Produit</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="modal-body">
            <form class="row g-3 needs-validation" id="myform" novalidate>
                <div class="col-md-12">
                    <label for="nomProd" class="form-label">Nom produit:</label>
                    <input type="text" class="form-control" id="nomProd" name="nomProd" placeholder="enter un nom" required>
                    <div class="invalid-feedback">
                    nom produit requis!
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="numLot" class="form-label">Numero lot:</label>
                    <input type="number" class="form-control" id="numLot" name="numLot" placeholder="" required>
                    <div class="invalid-feedback">
                    numero de lot requis
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="datePerem" class="form-label">Date peremption</label>
                    <div class="input-group has-validation">
                    <input type="date" class="form-control" id="datePerem" name="datePerem" placeholder="" aria-describedby="inputGroupPrepend" required>
                    <div class="invalid-feedback">
                        date peremption requise!
                    </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="qteProd" class="form-label">Quantite Disponible</label>
                    <input type="number" class="form-control" id="qteProd" name="qteProd" placeholder="" required>
                    <div class="invalid-feedback">
                    quantite de produit requise!
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="prixU" class="form-label">Prix unitaire</label>
                    <input type="number" class="form-control" id="prixU" name="prixU" placeholder="" required>
                    <div class="invalid-feedback">
                    prix unitaire requis!
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="fournisseur" class="form-label">Fournisseur</label>
                    <select type="text" class="form-control" id="fournisseur" name="fournisseur" placeholder="" required></select>
                    <div class="invalid-feedback">
                    fournisseur requis!
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="categoris" class="form-label">Categorie</label>
                    <select type="text" class="form-control" id="categorie" name="categorie" placeholder="" required></select>
                    <div class="invalid-feedback">
                    categoris requise!
                    </div>
                </div>
               
            
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <div class="col-12">
                    <div class="d-flex justify-content-center">
                    <button class="btn btn-outline-danger" data-bs-dismiss="modal">cancel</button>
                    <button class="btn btn-outline-primary mx-3" type="submit" id="btn-send">Modifier</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
  </div>
</div>

  <!--end modal to delete -->
 
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

</body>
</html>