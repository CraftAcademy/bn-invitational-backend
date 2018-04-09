class ResultSerializer < ActiveModel::Serializer
  attributes :id, :athletename, :score, :numberofvotes, :validscore

  def athletename
    object.athlete.name
  end

  def numberofvotes
    object.number_of_votes
  end

  def validscore
    object.valid_score
  end
end
