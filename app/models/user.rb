class User < ApplicationRecord
  has_one :profile
  has_many :histories
  has_many :workouts
  has_many :workout_sets, through: :workouts
end
