require 'RecipeRepository'


def reset_recipe_table
  seed_sql = File.read('spec/recipes_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_test' })
  connection.exec(seed_sql)
end

RSpec.describe RecipeRepository do
  before(:each) do 
    reset_recipe_table
  end 
  it "returns all lines from data base" do 
    repo = RecipeRepository.new
    recipes = repo.all

    expect(recipes.length).to eq  2
    expect(recipes[0].id).to eq  "1"
    expect(recipes[0].names).to eq  'beans on toast'
    expect(recipes[0].cooking_time).to eq "30"
    expect(recipes[0].rating).to eq "3"
    expect(recipes[1].id).to eq  "2"
    expect(recipes[1].names).to eq  'chicken and chips'
    expect(recipes[1].cooking_time).to eq  "10"
    expect(recipes[1].rating).to eq  "5"
  end 
    it "returns one object when searched for with id" do 
    repo = RecipeRepository.new
    recipes = repo.find(1)

    expect(recipes.length).to eq  1
    expect(recipes[0].id).to eq  "1"
    expect(recipes[0].names).to eq  'beans on toast'
    expect(recipes[0].cooking_time).to eq "30"
    expect(recipes[0].rating).to eq "3"
  end 



  # (your tests will go here).
end