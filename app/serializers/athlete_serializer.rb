class AthleteSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :name, :link

  def link
    api_v1_athlete_url(object)
  end
end
