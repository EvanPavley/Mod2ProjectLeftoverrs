class Ingredient < ApplicationRecord
  include HTTParty
  base_uri "http://www.recipepuppy.com/api"

  #single ingredient                   #?i= searches for ingredients
  response = HTTParty.get('http://www.recipepuppy.com/api/?i=pasta')
  parsed_response = JSON.parse(response)
  parsed_response["results"][0]["ingredients"]

  #multiple ingredient                           #append %2C+ for each except the last
  response = HTTParty.get('http://www.recipepuppy.com/api/?i=potato%2C+ham%2C+cheese')


  puts response
end
