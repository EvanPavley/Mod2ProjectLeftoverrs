class Recipe < ApplicationRecord
  has_many :user_recipes
  has_many :users, through: :user_recipes

  def users_count
    self.users.count
  end
end
