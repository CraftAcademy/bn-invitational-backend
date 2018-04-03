class AthleteSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :name, :link

  def link
      "http://localhost:3000/#{object.id}"
    #"#{api_v1_athletes_url(host: 'http://localhost:3000')}/#{object.id}"
    #tried to use URL helpers
    #api_v1_athletes_url(object) = http://localhost:3000/api/v1/athletes.1
    #Need help to understand this better
  end
end
