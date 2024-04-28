<?php
require_once 'connexiondb.php';
$conn = connexionMysqli();

$sql = "SELECT 
(SELECT COUNT(numFact) FROM ventes) AS countVentes,
(SELECT COUNT(idAppro) FROM approvisionnement) AS countAppro,
(SELECT COUNT(idClient) FROM client) AS countClients,
(SELECT COUNT(idFournis) FROM fournisseur) AS countFournisseurs";
$result = $conn->query($sql);

// Construction du tableau de résultats
$data = array();
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $data[] = array(
        'countVentes' => $row['countVentes'],
        'countAppro' => $row['countAppro'],
        'countClients' => $row['countClients'],
        'countFournisseurs' => $row['countFournisseurs']
      );
  }
}
echo json_encode($data);

$conn->close();
?>

<script>
    $(document).ready(function(){
        $.ajax({
        method:"get",
        url:"getStat.php",
        dataType:"json",
        success:function (response){
          $('#countVentes').text(response[0]['countVentes']);
          $('#countAppro').text(response[0]['countAppro']);
          $('#countClients').text(response[0]['countClients']);
          $('#countFournisseurs').text(response[0]['countFournisseurs']);

        },
        error : function(){
          
        }
      });
    })
  </script>