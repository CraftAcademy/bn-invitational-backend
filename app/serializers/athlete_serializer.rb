class AthleteSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :name, :link, :home, :image, :starttime

  def link
    api_v1_athlete_url(object)
  end

  def image
    unless object.image.attachment.nil?
      object.image.service_url(expires_in: 1.hour, disposition: 'inline')
    end
  end
end
