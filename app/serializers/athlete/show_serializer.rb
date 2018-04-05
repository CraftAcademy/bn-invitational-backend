class Athlete::ShowSerializer < ActiveModel::Serializer
  attributes :name, :age, :home, :starttime
end
