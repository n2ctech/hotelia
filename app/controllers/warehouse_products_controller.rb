class WarehouseProductsController < BaseController
  def index
    @q = scope.ransack(params[:q])
    if params.dig(:q, :product_subcategory_id_eq).present?
      @subcategory =
        Subcategory.find_by id: params.dig(:q, :product_subcategory_id_eq)
      price_column = "price_#{current_user.currency.downcase}"
      @max_price = @q.result.maximum(price_column).to_f
      @min_price = @q.result.minimum(price_column).to_f
    end
    if params.dig(:q, :product_collection_id_eq).present?
      @collection =
        Collection.find_by id: params.dig(:q, :product_collection_id_eq)
    end
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
