class View
  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_for_recipe_info
    puts "Please enter a name for the recipe"
    name = gets.chomp
    puts "Please enter a description"
    description = gets.chomp
    return [name, description]
  end

  def ask_for_index
    puts "What number do you want to delete?"
    gets.chomp.to_i - 1
  end
end