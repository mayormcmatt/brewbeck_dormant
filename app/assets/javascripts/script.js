$(document).ready(function() {
    $('ul.beer-drop').hover(function() {
        $(this).find('abv-drop').fadeToggle(400);
    });
});