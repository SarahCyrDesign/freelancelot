Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
    - A user[:role => freelancer] has_many :projects
- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
   - A project belongs_to a :freelancer
- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  - A Category has_many :projects, through: :project_categories
- [X] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  - name attribute is shared
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  - Project model validations include title must be present and ticket number must be unique
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
   -Project model uses class methods to check when projects are in different statuses and if they are due soon.
- [X] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
  - Nested form for project_categories in the new project form
- [X] Include signup (how e.g. Devise)
    - Devise gem included
- [X] Include login (how e.g. Devise)
    - Devise gem allows for login
- [X] Include logout (how e.g. Devise)
    - Devise gem allows for logout
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
    - Using Facebook as a 3rd party login from Omniauth
- [X] Include nested resource show or index (URL e.g. users/2/recipes)
      Nested resources for specific user's projects (Index and Show)
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
   -users/1/projects
- [X] Include form display of validation errors (form URL e.g. /recipes/new)
-  Message partial included in layout display messages

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
