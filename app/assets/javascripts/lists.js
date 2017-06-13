$(document).ready(function() {
  bindClickHandlers();
})

function bindClickHandlers() {
  $(".list-link").on("click", function(event) {
    event.preventDefault();
    let id=$(this).attr('data-id')
    fetch(`/lists/${id}.json`, {credentials: 'include'})
      .then(function(response) {
        return response.json()
      })
      .then(function(list) {
        console.log(list)
      })
  })
}
