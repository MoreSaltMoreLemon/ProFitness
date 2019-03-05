class Exercise < ApplicationRecord
  belongs_to :category
  has_many :workout_sets
  has_many :workouts, through: :workout_sets

  validates :name, :description, :instruction, :hero_image, presence: true

end
