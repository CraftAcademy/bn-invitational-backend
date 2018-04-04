class Athlete::ShowSerializer < ActiveModel::Serializer
  attributes :name, :age, :home, :start_time
end
