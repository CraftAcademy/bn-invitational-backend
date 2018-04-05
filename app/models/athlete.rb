class Athlete < ApplicationRecord
  validates :name, :age, :home, presence: true
end
