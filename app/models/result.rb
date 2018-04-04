class Result < ApplicationRecord
  belongs_to :athlete

  def updated_votes(params)
    self.rating_collection << params[:vote].to_i
    self.score = (self.rating_collection.sum) / (self.rating_collection.length)
    self.number_of_votes = self.rating_collection.length
    self.save
  end
end
