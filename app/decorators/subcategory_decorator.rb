class SubcategoryDecorator < Draper::Decorator
  def full_name
    " / #{object.category.name} / #{object.name}"
  end
end
