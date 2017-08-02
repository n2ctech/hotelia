class ProductDecorator < Draper::Decorator
  def thumb_url
    object.first_image&.thumb_url ||
      ActionController::Base.helpers.image_path("Products/Products1.png")
  end
end
