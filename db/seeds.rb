require 'open-uri'
require 'json'
Cocktail.create!([{ name: 'Mojito' }, { name: 'Mickey' }])

Ingredient.destroy_all
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_list = open(url).read
list = JSON.parse(ingredients_list)
list["drinks"].each do |ingredient|
Ingredient.create(name: ingredient["strIngredient1"])
end
