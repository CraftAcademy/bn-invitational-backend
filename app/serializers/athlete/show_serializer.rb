class Athlete::ShowSerializer < ActiveModel::Serializer
  attributes :name, :home, :age
end
