$(document).ready(function () {
    $("div").not($(".main_nav")).hover(function () {
        $("dl").css("display", "none");
    });

    $(".rootNav li").first().hover(function () {
        $("dl").css("display", "none");
    });

    $("#partnerSites").change(function () {
        if ($(this).get(0).selectedIndex != 0) {
            location.href = $(this).val();
        }
    });

});
function showSelect(id) {
    for (i = 1; i <= 8; i++) {
        if (i == id) {
            document.getElementById("nav" + i).style.display = "block";
        } else {
            document.getElementById("nav" + i).style.display = "none";
        }
    }
}
function clearList() {
    for (i = 1; i < 8; i++) {
        document.getElementById("nav" + i).style.display = "none";
    }
}