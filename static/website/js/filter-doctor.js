$(document).ready(function () {
    $("#doctor").on("keyup", function (e) {
        e.preventDefault();
        var value = $(this).val().toLowerCase();
        $(".expert_info").filter(function () {
            $(this).toggle($('.doctor_name_department', $(this)).text().toLowerCase().indexOf(value) > -1)
        });
    });
});