class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  layout "application"
end
