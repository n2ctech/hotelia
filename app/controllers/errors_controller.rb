class ErrorsController < ApplicationController
  def error404
    if current_user
      render status: :not_found
    else
      render file: Rails.root.join('public', '404.html'), layout: false, status: :not_found
    end
  end
end
