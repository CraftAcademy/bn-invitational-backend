class ResultSerializer < ActiveModel::Serializer
  attributes :id, :athletename, :score, :numberofvotes, :valid_score

  def athletename
    athlete = Athlete.find_by(id: object.athlete_id)
    athlete.name
  end
end
