class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :description, presence: true
  validates :preparation_unit, presence: true
  validates :preparation_unit, numericality: { greater_than_or_equal_to: 0 }
  validates :preparation_unit, numericality: { only_integer: true }
  validates :cooking_time, presence: true
  validates :cooking_time, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time, numericality: { only_integer: true }
end
