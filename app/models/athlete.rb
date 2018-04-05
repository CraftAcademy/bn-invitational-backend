class Athlete < ApplicationRecord
  validates :name, :age, :home, presence: true
  has_one_attached :image
end
