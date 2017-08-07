class SettingsController < ApplicationController

  def change_locale
    current_user.update locale: params[:locale]
    redirect_back(fallback_location: root_path)
  end

  def change_currency
    current_user.update currency: params[:currency]
    redirect_back(fallback_location: root_path)
  end

end
