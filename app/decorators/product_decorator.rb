class ProductDecorator < Draper::Decorator
  def thumb_url
    object.first_image&.thumb_url ||
      ActionController::Base.helpers.image_path("Products/Products1.png")
  end

  def file_url
    object.first_image&.file_url ||
      ActionController::Base.helpers.image_path("Products/Products1.png")
  end

  def short_description
    object.description.to_s.truncate 120
  end
end
