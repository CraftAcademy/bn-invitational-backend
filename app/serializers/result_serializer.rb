class ResultSerializer < ActiveModel::Serializer
  attributes :id, :athlete_name, :score, :number_of_votes

  def athlete_name
    athlete = Athlete.find_by(id: object.athlete_id)
    return athlete.name
  end
end
