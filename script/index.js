$(document).ready(function() {

 $('#example').DataTable({
        ajax: 'forms/server_processingS.php',
        processing: true,
        ordering: false,
        scroller: true,
        scrollY: 200,
        searching: true,
        serverSide: true
    });
});
