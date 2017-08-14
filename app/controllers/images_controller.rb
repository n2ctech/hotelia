class ImagesController < ApplicationController
  before_action :authenticate_admin_user!
  skip_before_action :verify_authenticity_token

  def create
    image = Image.create file: params[:file]
    render json: { id: image.id, url: image.file_url }
  end

end
