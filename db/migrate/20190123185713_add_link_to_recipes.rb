class AddLinkToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :link, :string
  end
end
