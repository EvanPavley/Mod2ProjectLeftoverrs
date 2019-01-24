class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def new
    @recipe = Recipe.new
  end

  def create
    @user = User.find(session[:user_id])
    @recipe = Recipe.find_or_create_by(recipe_params)
    if !@user.recipes.include?(@recipe)
      @user.recipes << @recipe
      redirect_to search_path(params[:search][:id].to_i)
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @recipe = Recipe.find(params[:recipe][:id].to_i)
    @join = UserRecipe.where(user_id: @user.id, recipe_id: @recipe.id)[0]
    @join.destroy
    redirect_to user_path(session[:user_id])
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :img, :link)
    end
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end
