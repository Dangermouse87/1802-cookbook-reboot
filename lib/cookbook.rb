require 'csv'

class Cookbook
  def initialize(csv_file)
    # array to store our instances
    @recipes = []
    @csv_file = csv_file
    # we load an existing csv file if it exists.
    load_csv if File.exist?(@csv_file)
  end

  def all
    # returns all recipes
    return @recipes
  end

  def create(recipe) # takes a Recipe instance
    # the recipe instance is then stored into @recipes 
    @recipes << recipe
    # the updated @recipes array is then saved to the CSV file
    save_csv
  end

  def destroy(recipe_index) # takes an integer as an argument
    # the index retrieved from the user is then used to delete the user's choice from the array
    @recipes.delete_at(recipe_index)
    # the updated @recipes array is then saved to the CSV file
    save_csv
  end

  private

  def load_csv
    # CSV foreach to iterate over each array of strings inside the CSV file
    CSV.foreach(@csv_file) do |row|
      # Each element row data is then store to @recipes as new instances of Recipe
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      # iterate over each recipe in the cookbook repository
      @recipes.each do |recipe|
        # store the instance data into a CSV file as an array
        csv << [recipe.name, recipe.description]
      end
    end
  end
end