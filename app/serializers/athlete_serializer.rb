class AthleteSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :name, :link, :home

  def link
    api_v1_athlete_url(object)
  end
end
