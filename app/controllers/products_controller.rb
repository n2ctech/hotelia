class ProductsController < ApplicationController
  def index
    @warehouse_products = WarehouseProductFilter
      .new(current_user, params).filter
  end
end
