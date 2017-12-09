
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
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/categories/" + nextId + ".json", function(data) {
      var category = data; //category variable has access to projects ex) category.projects
      // debugger
      $(".categoryName").text(category["name"]);

      //Trying to add projects to categories
      let projects = category.projects;
      load_projects();
      // re-set the id to current on the link
      $(".js-next").attr("data-id", category["id"]);
    });
  });
});




//Refactored Code

function load_projects() {

let url = `/categories/${$(".js-next").attr("data-id")}/projects`

$.get(url, function(projectsJSON) {

  var $list = $("#projects_list")
  $list.html('')
  let projectHtml = '' //start text out with blank string

  if (projectsJSON.length === 0) {
    projectHtml = `No projects started`
    $list.html('')
    $list.append(projectHtml);


  } else {
      projectsJSON.forEach(function(project) {
        let newProject = new Project(project)
        let projectHtml = newProject.formatIndex()
        $list.append(projectHtml);
      })
     }
  })
}
