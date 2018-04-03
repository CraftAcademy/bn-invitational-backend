class AthleteSerializer < ActiveModel::Serializer
  #include Rails.application.routes.url_helpers
  attributes :name, :link

  def link
    "https://votingapi.herokuapp.com/#{object.id}"
    #tried to use URL helpers
    #api_v1_athletes_url(object, host: 'http://localhost:3000' ) = http://localhost:3000/api/v1/athletes.1
    #Need help to understand this better
  end
end
