class Athlete < ApplicationRecord
  validates :name, :age, :home, presence: true
  has_one_attached :image

  def open_or_close_voting
    self.votingOpen == false ? self.votingOpen = true : self.votingOpen = false
  end
end
