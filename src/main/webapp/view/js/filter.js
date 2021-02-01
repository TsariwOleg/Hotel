$("#priceRange").change(function(e) {
    e.preventDefault();
    $("#priceRangeNumber").val($("#priceRange").val())
});