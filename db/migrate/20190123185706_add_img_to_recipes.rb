class AddImgToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :img, :string
  end
end
