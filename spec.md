# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project - Project was initiated using the rails new command.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) - A list has many tasks.
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) - A task belongs to a list.
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) - A user has many tasks through lists.
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) - A user is assigned a permission level when they create a new list. They can share that list with another user, which changes their permission level for that list.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - A list and a task cannot be created without the presence of a name. Additionally, users cannot be created without unique emails.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - A class level method for Task organizes each task in a list according to its due-date.
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) - When a list is created, it uses a custom attribute writer to set the permission level of that list for the user to owner.
- [x] Include signup (how e.g. Devise) - Devise is used for sign up. Sign up form was customized to include first and last names.
- [x] Include login (how e.g. Devise) - Devise is used for login.
- [x] Include logout (how e.g. Devise) - Devise is used for logout.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Third party signup/login is provided through Google and Devise's omniauthable module.
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - Tasks are nested resources under lists. A task does not exist without a list.
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) - A nested new form is included in creating a new task from an existing list.
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - Error fields are highlighted with a red border and error messages are displayed at the top of the view.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
