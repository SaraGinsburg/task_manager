$(document).ready(function() {
  bindClickHandlers();
})

function bindClickHandlers() {
  $(".list-link").on("click", function(event) {
    event.preventDefault();
    let id=$(this).attr('data-id')
    fetch(`/lists/${id}.json`, {credentials: 'include'})
      .then(response => response.json())
      .then(list => {
        $("#tasks-container").html("")
        list.tasks.forEach(task => {
          console.log(task)
          let newTask = new Task(task);
          let taskHtml = newTask.formatTask();
          let $container = ".list-" + task.list_id + "-tasks-container"
          $($container).append(taskHtml)
        })
      })
  })
}

function Task(task) {
  this.id = task.id
  this.name = task.name
  this.status = task.status
  this.due_date = task.due_date
  this.list_id = task.list_id
}

Task.prototype.formatTask = function() {
  let taskHtml = `
    <li class="${this.status}">${this.name}<li>
  `
  return taskHtml
}
