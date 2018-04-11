require 'net/http'
module NotificationsHandler
  extend ActiveSupport::Concern

  def file_data(name)
    File.read(Rails.root.to_s + "/app/controllers/concerns/files/#{name}.txt")
  end

  def push_notification(obj)
    one_signal_url = 'https://onesignal.com/api/v1/notifications'
    params = eval(file_data('notifications_params'))

    uri = URI.parse(one_signal_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path,
                              'Content-Type'  => 'application/json;charset=utf-8',
                              'Authorization' => Rails.application.credentials.dig(:onesignal, :api_key))

    request.body = params.to_json
    http.request(request)
  end
end
