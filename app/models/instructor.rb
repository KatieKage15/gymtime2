class Instructor < ApplicationRecord
  has_many :trainings
  has_many :users, through: :trainings

  validates :name, presence: true
end
