//Document Ready

$(function() {
  attachListeners()
})


//Event Listeners and click events

const attachListeners = () => {
  $(document).on('click', 'a.load_projects', function(e) {
  e.preventDefault();
  $.get(this.url, function(data) {
    var $ol = $("#projects_list ol")
    if (data.projects.length === 0) {
      let projectHtml = `No projects started`
      $ol.append(projectHtml);
    } else {
        $ol.html("")
        data.projects.forEach(function(project) {
          let newProject = new Project(project)
          let projectHtml = newProject.formatIndex()
          $ol.append(projectHtml);
        })
       }
    })
})

//Click Event

$(document).on('click', 'a.show_project', function(e) {
  e.preventDefault();
  history.pushState({}, '', $(this).attr("href"))
  let id = parseInt($(this).attr('data-id'))
  $.get(`/projects/${id}.json`, function(project) {
    $(".body-container").html('')
    let newProject = new Project(project)
    let projectHtml = newProject.formatShow()
    $(".body-container").append(projectHtml)
    })
  })
}
