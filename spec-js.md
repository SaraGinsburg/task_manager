# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements. : Changes to the DOM are implemented with jQuery.
- [ ] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend. : All models are serialized using ASM. An index of tasks is rendered using jQuery on the main page of the SPA.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM. : A list has many tasks. Tasks are appended to the DOM upon a click action.  
- [ ] Include at least one link that loads or updates a resource without reloading the page.
- [x] Translate JSON responses into js model objects. : Tasks are translated into JavaScript model objects after an AJAX request to their index controller.  
- [x] At least one of the js model objects must have at least one method added by your code to the prototype. : The task model object has a method added to the prototype in order to format each task with a custom class based on its completion status.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
