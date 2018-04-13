class ResultSerializer < ActiveModel::Serializer
  attributes :id, :athletename, :score, :numberofvotes, :validscore, :hasraced

  def hasraced
    object.has_raced
  end

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
