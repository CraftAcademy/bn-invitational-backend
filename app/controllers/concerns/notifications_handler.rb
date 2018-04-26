require 'net/http'
module NotificationsHandler
  extend ActiveSupport::Concern

  def file_data(name)
    File.read(Rails.root.to_s + "/app/controllers/concerns/files/#{name}.txt")
  end

  def push_notification(params)
    if params[:action] == 'custom_push_notification'
      params = eval(file_data('custom_message'))
    elsif params[:action] == 'toggle'
      obj = Athlete.find_by(id: params[:id])
      params = eval(file_data('voting_params'))
    else
      params = eval(file_data('results_params'))
    end

    headers = eval(file_data('notifications_headers'))
    one_signal_url = 'https://onesignal.com/api/v1/notifications'

    uri = URI.parse(one_signal_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, headers)
    request.body = params.to_json
    http.request(request)
  end
end
