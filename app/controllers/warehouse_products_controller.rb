class WarehouseProductsController < BaseController
  def index
    @q = scope.ransack(params[:q])
    @warehouse_products = @q.result.page(params[:page]).per(params[:per_page])
  end

  def show
    @warehouse_product = scope.find params[:id]
    @related_products = scope.joins(:product)
      .where('products.subcategory_id = ?', @warehouse_product.product.subcategory_id)
      .take(5).reject{|p| p.id == @warehouse_product.id}
      .take(4)
  end

  private

  def scope
    WarehouseProduct
      .where(warehouse: current_user.hotel.location.warehouses)
      .where("chain_id IS NULL OR chain_id = ?", current_user.hotel.chain_id)
  end
end
