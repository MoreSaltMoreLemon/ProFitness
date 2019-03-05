class Category < ApplicationRecord
  has_many :exercises

  validates :name, presence: true
end
