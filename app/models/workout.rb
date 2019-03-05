class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_sets
  has_many :exercises, through: :workout_sets

  validates :date, presence: true

  def show_date
    self.date.strftime("%m/%d/%Y")
  end
end
