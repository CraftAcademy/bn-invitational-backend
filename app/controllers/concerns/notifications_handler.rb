module NotificationsHandler

  extend ActiveSupport::Concern

  def push_notification(title)
    params = {"app_id" => Rails.application.credentials.dig(:onesignal, :app_id),
            "headings" => {"en" => "title"},
            "contents" => {"en" => "English Message"},
            "included_segments" => ["All"]}
    uri = URI.parse('https://onesignal.com/api/v1/notifications')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path,
                              'Content-Type'  => 'application/json;charset=utf-8',
                              'Authorization' => Rails.application.credentials.dig(:onesignal, :api_key))
    request.body = params.to_json
    http.request(request)
  end
end
