class BaseController < ActionController::Base
  protect_from_forgery with: :exception
  layout "application"

  before_action :authenticate_user!
  before_action { I18n.locale = current_user.locale }
end
