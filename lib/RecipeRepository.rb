require_relative 'recipe'

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    sql = 'SELECT * FROM recipes;'
    output = []
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each{|recipes|
      recipe = Recipe.new

      recipe.id = recipes['id']
      recipe.names = recipes['names']
      recipe.cooking_time = recipes['cooking_time']
      recipe.rating = recipes['rating']
      output << recipe
    }
    output
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    sql = 'SELECT * FROM recipes WHERE id = $1;'
    paras = [id]
    output = []
    result_set = DatabaseConnection.exec_params(sql, paras)
    result_set.each{|recipes|
      recipe = Recipe.new

      recipe.id = recipes['id']
      recipe.names = recipes['names']
      recipe.cooking_time = recipes['cooking_time']
      recipe.rating = recipes['rating']
      output << recipe
    }
    output
  end
end