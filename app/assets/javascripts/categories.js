
//create a new category
$(function () {
  $('form').submit(function(e) {
    console.log("submitting")
    e.preventDefault();
    var values = $(this).serialize();
    var posting = $.post('/categories', values);
    posting.done(function(data) {
      var category = data;
      $("#categoryName").text(category["name"]);
    });
  });
});

//load next category
$(function () {
  $(".js-next").on("click", function(e) {
    e.preventDefault()
    console.log("next button clicked")
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/categories/" + nextId + ".json", function(data) {
      console.log(data)
      var category = data;
      $(".categoryName").text(category["name"]);
      // re-set the id to current on the link
      $(".js-next").attr("data-id", category["id"]);
    });
  });
});
