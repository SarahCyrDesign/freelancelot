
//create a new category
$(function () {
  $('form').submit(function(e) {
    e.preventDefault();
    var values = $(this).serialize();
    var posting = $.post('/categories', values);
    posting.done(function(data) {
      var category = data;
      $("#categoryName").text(category["name"]);
      //clear out the input form
      $('input[type="text"], textarea').val('');
    });
  });
});

// load next category
$(function () {
  $(".js-next").on("click", function(e) {
    e.preventDefault()
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/categories/" + nextId + ".json", function(data) {
      var category = data;
      $(".categoryName").text(category["name"]);
      // re-set the id to current on the link
      $(".js-next").attr("data-id", category["id"]);
    });
  });
});
