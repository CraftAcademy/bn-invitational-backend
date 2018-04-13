class Athlete < ApplicationRecord
  validates :name, :age, :home, presence: true
  has_one_attached :image

  def open_or_close_voting
    self.votingOpen == false ? self.votingOpen = true : self.votingOpen = false
    self.save
  end

  def self.all_has_raced
    all.each do |athlete|
      athlete.hasraced = true
      athlete.save
    end
  end

  def self.all_has_not_raced
    all.each do |athlete|
      athlete.hasraced = false
      athlete.save
    end
  end
end
