class Profile < ApplicationRecord
  belongs_to :user

  validates :sex, :height, :name, :birthdate, :metric, presence: true
end
