class CategoryDecorator < Draper::Decorator
  def thumb_url
    object.image&.thumb_url ||
      ActionController::Base.helpers.image_path("Products/Products1.png")
  end

  def file_url
    object.image&.file_url ||
      ActionController::Base.helpers.image_path("Products/Products1.png")
  end

  def full_name
    " / #{object.name}"
  end
end
