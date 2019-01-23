class SearchesController < ApplicationController
  #only if your logged in

  def new
    @oils = Ingredient.where(category: "oils")
    @spices = Ingredient.where(category: "spices")
    @vegfruits = Ingredient.where(category: "vegfruits")
    @meatdairys = Ingredient.where(category: "meatdairys")
    @grains = Ingredient.where(category: "grains")
    @nuts = Ingredient.where(category: "nuts")


  end

  def create
    @search = Search.create(ingredients: ingredients_to_s(), user_id: session[:user_id])
    redirect_to search_path(@search)
  end

  def ingredients_to_s
    i_s = ""
    params[:ingredients].each do |i|
      i_s += i + ","
    end
    i_s1 = i_s[0...-1]
    return i_s1
  end

  def show
    @search = Search.find(params[:id])
    x = "http://www.recipepuppy.com/api/?i=" + @search.ingredients
    @response = JSON.parse(HTTParty.get(x))["results"]
  end

end

#user_id
#rails g migration add_user_to_searches user:references
#ingredients
#rails g migration add_ingredients_to_searches ingredients:text
