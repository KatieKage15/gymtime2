class Training < ApplicationRecord
  belongs_to :user
  belongs_to :instructor

  validates :name, presence: true
end
