class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :measurement_unit, presence: true
  validates :measurement_unit, inclusion: { in: %w[g kg ml l oz lb] }
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true
end
