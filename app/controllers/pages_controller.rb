class PagesController < BaseController
  include HighVoltage::StaticPage

  def home
    @home_config = HomeConfig.first
    @slider_warehouse_products =
      scope.where(product_id: @home_config.slider_product_ids)
      .to_a.sort_by{|e| @home_config.slider_product_ids.index(e.product_id)}

    @warehouse_product_list_1 =
      scope.where(product_id: @home_config.product_list_1_ids)
      .to_a.sort_by{|e| @home_config.product_list_1_ids.index(e.product_id)}
    @warehouse_product_list_2 =
      scope.where(product_id: @home_config.product_list_2_ids)
      .to_a.sort_by{|e| @home_config.product_list_2_ids.index(e.product_id)}
    @categories = @home_config.categories
    @popular_warehouse_products =
      scope.where(product_id: @home_config.popular_product_ids)
      .to_a.sort_by{|e| @home_config.popular_product_ids.index(e.product_id)}
  end

  private

  def scope
    WarehouseProduct
      .where(warehouse: current_user.hotel.location.warehouses)
      .where("chain_id IS NULL OR chain_id = ?", current_user.hotel.chain_id)
  end
end
