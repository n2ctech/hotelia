class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def set_admin_locale
    I18n.locale = :en
  end
end
