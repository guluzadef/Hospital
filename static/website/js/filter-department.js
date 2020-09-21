$(document).ready(function() {
    $("#department").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#departmentList div").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
});