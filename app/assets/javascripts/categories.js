$(function () {
  $('form').submit(function(e) {
    e.preventDefault();
    var values = $(this).serialize();
    var posting = $.post('/categories', values);
    posting.done(function(data) {
      var category = data;
      $("#categoryName").text(category["name"]);
    });
  });
});


$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/categories/" + nextId + ".json", function(data) {
      var product = data;
      $(".categoryName").text(category["name"]);
      // re-set the id to current on the link
      $(".js-next").attr("data-id", category["id"]);
    });
  });
});
