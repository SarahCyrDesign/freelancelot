
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

// load next category - on load projects appear
$(function () {
  $(".js-next").on("click", function(e) {
    e.preventDefault()
    const nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/categories/" + nextId + ".json", function(category) {
      //category variable has access to projects ex) category.projects
      $(".categoryName").text(category.name);
      //Load json data into project variable
      load_projects(category.projects);
      // re-set the id to current on the link
      $(".js-next").attr("data-id", category.id);
    });
  });
});


//Load projects under each category
function load_projects(projects) {
  const $list = $("#projects_list")
  $list.html('')
  if (projects.length === 0) {
    $list.append("No Projects Started");
  } else {
    const renderedProjects = projects.map(attr => new Project(attr).formatIndex())
    $list.append(renderedProjects);
  }
}
