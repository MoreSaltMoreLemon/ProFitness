require 'bcrypt'

class User < ApplicationRecord
  has_one :profile
  # has_many :histories
  has_many :workouts
  has_many :workout_sets, through: :workouts

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  def personal_stats
  end
  
end
