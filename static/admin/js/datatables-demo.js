$(document).ready(function() {
  dTable = $('#dataTable').DataTable();
  $('.custom-filter').on("change", function() {
    dTable.search($(this).val()).draw();
  })
});
