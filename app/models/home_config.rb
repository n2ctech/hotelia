class HomeConfig < ApplicationRecord
  has_many :home_slider_products, ->{where association_type: "home_slider_products"},
    class_name: HomeProduct.name
  has_many :home_product_list_1, ->{where association_type: "home_product_list_1"},
    class_name: HomeProduct.name
  has_many :home_product_list_2, ->{where association_type: "home_product_list_2"},
    class_name: HomeProduct.name
  has_many :home_popular_products, ->{where association_type: "home_popular_products"},
    class_name: HomeProduct.name
  has_many :home_categories
  has_one :promotional_banner_image, class_name: Image.name,
    as: :attachable

  has_many :categories, through: :home_categories
  has_many :slider_products, through: :home_slider_products, source: :product
  has_many :product_list_1, through: :home_product_list_1, source: :product
  has_many :product_list_2, through: :home_product_list_2, source: :product
  has_many :popular_products, through: :home_popular_products, source: :product

  accepts_nested_attributes_for :home_slider_products, :home_product_list_1,
    :home_product_list_2, :home_popular_products, :promotional_banner_image,
    :home_categories,
    reject_if: :all_blank, allow_destroy: true
end
