class AthleteSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :name, :link, :home, :image

  def link
    api_v1_athlete_url(object)
  end
  def image
    object.image.attachment.blob.service_url if object.image.service_url
  end
end
