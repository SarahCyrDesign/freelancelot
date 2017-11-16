//Document Ready

$(function() {
  attachListeners()
})


//Event Listeners and click events

const attachListeners = () => {
  $(document).on('click', 'a.load_projects', function(e) {
  e.preventDefault();
  let url = `/categories/${$(".js-next").attr("data-id")}`
  $.get(url, function(data) {
    var $list = $("#projects_list")
    if (data.projects.length === 0) {
      let projectHtml = `No projects started`
      $list.html("")
      $list.append(projectHtml);
    } else {
        $list.html("")
        data.projects.forEach(function(project) {
          let newProject = new Project(project)
          let projectHtml = newProject.formatIndex()
          $list.append(projectHtml);
        })
       }
    })
})

//Click Event for projects dashboard

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



//project object constructor

function Project(project) {
  this.id = project.id
  this.title = project.title
  this.description = project.description
  this.client_name = project.client_name
  this.freelancer_id = project.freelancer_id
  this.invoice_sent = project.invoice_sent
  this.status = project.status
  this.budget = project.budget
  this.time_log = project.time_log
  this.start_date = project.start_date
  this.deadline = project.deadline
  this.ticket = project.ticket

  //category needed?
  this.category_ids = project.category_ids
  this.categories_attributes = project.categories_attributes
}


//for projects/dashboard

Project.prototype.formatIndex = function() {
  let projectHtml = `
    <a href="/projects/${this.id}" data-id="${this.id}" class="show_project">${this.title} | ${this.client_name}| ${this.ticket} | ${this.deadline}</a> `
  return projectHtml
}


//Project prototype

Project.prototype.formatShow = function() {
  let projectHtml = `
    <h3>${this.title}<h3>
    <p>${this.description}</p>
    <p>Budget: ${this.budget}</p>
    <p>Start Date: ${this.start_date}</p>
    <p>Deadline: ${this.deadline}</p>
    <p>Hours Currently Logged: ${this.time_log}</p>
    <p>Project Status: ${this.status}</p>
    <p>Invoice Sent? ${this.invoice_sent}</p><br>
    <a href="/projects/${this.id}/edit">Edit Project</a><br><br>
    <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/projects/${this.id}">Delete</a>
   `
    return projectHtml
}
