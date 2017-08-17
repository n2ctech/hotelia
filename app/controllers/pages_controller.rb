class PagesController < BaseController
  include HighVoltage::StaticPage

  def home
    @slider_products = Product.first(4)
    @product_list_1 = Product.first(6)
    @warehouse_product_list_2 = WarehouseProduct.first(8)
    @categories = Category.first(4)
    @populer_warehouse_products = WarehouseProduct.first(20)
  end
end
