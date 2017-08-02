class BaseController < ActionController::Base
  protect_from_forgery with: :exception
  layout "application"

  before_action :authenticate_user!, if: ->{request.fullpath !~ %r[^/admin] }
end
