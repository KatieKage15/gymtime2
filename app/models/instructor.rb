class Instructor < ApplicationRecord
  has_many :trainings
  has_many :clients, through: :trainings

  validates :name, presence: true
end
