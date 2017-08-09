class WarehouseProductsController < BaseController
  def index
    @q = WarehouseProduct.ransack(params[:q])
    hotel = current_user.hotel
    @warehouse_products = @q.result
      .where(warehouse: hotel.location.warehouses)
      .where("chain_id IS NULL OR chain_id = ?", hotel.chain_id)
      .page(params[:page]).per(params[:per_page])
  end

  def show
    hotel = current_user.hotel
    @warehouse_product = WarehouseProduct
      .where(warehouse: hotel.location.warehouses)
      .where("chain_id IS NULL OR chain_id = ?", hotel.chain_id)
      .find params[:id]
  end
end
