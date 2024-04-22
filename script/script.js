// new DataTable('#example', {
//     scrollCollapse: true,
//     scroller: true,
//     scrollY: 200,
//     ajax: {
//         url: "getProd.php",
//         method: "GET",
//         dataType: "json",
//         dataSrc: function(response) {
//         var data = $.map(response, function(item) {
//             return {
//                 idProd: item.idProd,
//                 nomProd: item.nomProd,
//                 numLot: item.numLot,
//                 imageProd: '<img src="' + item.imageProd + '" alt="' + item.nomProd + '" width="50" height="50">',
//                 datePerem: item.datePerem,
//                 qteDispo: item.qteDispo,
//                 prixU: item.prixU,
//                 nomFournis: item.nomFournis,
//                 nomCategorie: item.nomCategorie,
//             };
//         });
//         return data;
//         }
//     },
//     columns: [
//         { data: "idProd" },
//         { data: "nomProd" },
//         { data: "numLot" },
//         { data: "qteDispo" },
//         { data: "prixU" },
//         { data: "nomFournis" },
//         { data: "nomCategorie" },
//         { data: "imageProd",
//             render: function(data, type, row) {
//                 if (type === 'display') {
//                 return data;
//                 }
//                 return row.imageProd;
//             }
//             },
//         { data: "idProd" },
//         { data: "nomProd" },
//         { data: "numLot" },
//         { data: "qteDispo" },
//         { data: "prixU" },
//         { data: "nomFournis" },
//         { data: "nomCategorie" },
//         { data: "imageProd" },
//     ]
// });
