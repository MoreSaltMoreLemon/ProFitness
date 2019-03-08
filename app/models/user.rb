require 'bcrypt'

class User < ApplicationRecord
  attr_accessor :graph_data
  has_one :profile
  # has_many :histories
  has_many :workouts
  has_many :workout_sets, through: :workouts

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5}, format: { with: /[0-9!@#$%^&*\(\)\\\/\[\]]+/, message: "must include non-alphabetic characters."}

  has_secure_password

  def last_five_workouts
    sorted_workouts = self.workouts.sort_by(&:date).reverse
    workouts_with_sets = sorted_workouts.select {|w| w.workout_sets.any? }
    workouts_with_sets[0..4]
  end
end
