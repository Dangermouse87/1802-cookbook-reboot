require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # get all the recipes
    recipes = @cookbook.all
    # tell the view to display
    @view.display_list(recipes)
  end

  def add
    # get name and the description from the user
    info = @view.ask_for_recipe_info
    name = info[0]
    description = info[1]
    # create new instance of Recipe
    recipe = Recipe.new(name, description)
    # save it to the cookbook
    @cookbook.create(recipe)
  end

  def destroy
    #getting index from the user
    number = @view.ask_for_index
    # deleting the recipe
    @cookbook.destroy(number)
  end
end