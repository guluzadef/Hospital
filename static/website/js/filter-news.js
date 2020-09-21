$(document).ready(function () {
    $("#news").on("keyup", function (e) {
        e.preventDefault();
        var value = $(this).val().toLowerCase();
        $(".news_card").filter(function () {
            $(this).toggle($('.news_title', $(this)).text().toLowerCase().indexOf(value) > -1)
        });
    });
});