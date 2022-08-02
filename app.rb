# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/RecipeRepository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes')

repo = RecipeRepository.new

p repo.find(1)