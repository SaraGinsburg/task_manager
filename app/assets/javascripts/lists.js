$(document).ready(function() {
  bindClickHandlers();
})

function bindClickHandlers() {
  $(".list-link").on("click", function(event) {
    event.preventDefault();
    console.log("hello");
  })
}
