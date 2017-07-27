$(document).ready(function() {
  bindClickHandlers();
})

function bindClickHandlers() {
  $(".list-link").on("click", function(event) {
    event.preventDefault();
    let id = $(this).attr('data-id')
    listApi.getList(id)
      .then(list => appendListToDOM(list, $("#tasks-container")))
  })

  $(document).on("click", '.delete_button', function(event) {
    event.preventDefault();
    fetch(`${this.action}`, {
      method: 'delete',
      credentials:'include'
    })
      .then(response => $(event.target).hide())
  })

  // $(document).on("click", '.task-link', function(event) {
  //   event.preventDefault();
  //   let id=$(this).attr('data-id');
  //   let listId=$(this).attr('data-listid');
  //   fetch(`/lists/${listId}/tasks/${id}`, {
  //     method: 'patch',
  //     credentials: 'include'
  //   })
  // })
}

function appendListToDOM(list, element) {
  element.html("")
  list.tasks.forEach(task => {
    let newTask = new Task(task);
    let taskHtml = newTask.formatTask();
    let $container = ".list-" + task.list_id + "-tasks-container"
    $($container).append(taskHtml)
  })
}

const listsApi = {
  getList(id) {
    return fetch(`/lists/${id}.json`, {credentials: 'include'})
      .then(response => response.json())
  },

  getLists() {
    return fetch(`/lists.json`, { credentials: 'include' })
      .then(response => response.json())
  },

  createList(list) {
    return fetch(`/lists`, {
      method: 'POST',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ list: list })
     })
   }
      .then(response => response.json())
      .catch(error => console.log("Error creating list: ", error))
  }

  updateList(list) {
    return fetch(`/lists/${list.id}`) {
      method: 'PATCH',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ list: list
      })
    }
      .then(response => response.json())
      .catch(error => console.log("Error updating list: ", error))
  }
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
    <li class="${this.status}">
      <a href="/lists/${this.list_id}" class="task-link" data-id="${this.id}" data-listid="${this.list_id}">${this.name}</a>
      <form class="button_to delete_button" method="post" action="/lists/${this.list_id}/tasks/${this.id}">
        <input type="hidden" name="_method" value="delete">
        <input type="submit" name="commit" value="❌">
      </form>
    <li>
  `
  return taskHtml
}
