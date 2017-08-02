class WarehouseProductsController < BaseController
  def index
    @q = WarehouseProduct.ransack(params[:q])
    hotel = current_user.hotel
    @warehouse_products = @q.result
      .joins(:product)
      .where(warehouse: hotel.location.warehouses)
      .where("chain_id IS NULL OR chain_id = ?", hotel.chain_id)
      .page(params[:page]).per(params[:per_page])
  end
end
