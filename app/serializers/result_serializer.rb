class ResultSerializer < ActiveModel::Serializer
  attributes :id, :athletename, :score, :numberofvotes, :validscore

  def athletename
    athlete = Athlete.find_by(id: object.athlete_id)
    athlete.name
  end
end
