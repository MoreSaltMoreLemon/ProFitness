class Profile < ApplicationRecord
  attr_accessor :height_unit, :weight_unit
  belongs_to :user

  validates :height, :starting_weight, :name, :age, :metric, presence: true


end
