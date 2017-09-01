class WarehouseProductsController < BaseController
  def index
    @q = scope.ransack(params[:q])
    filter_by_category
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

  def filter_by_category
    filter = nil
    if params.dig(:q, :product_subcategory_id_eq).present?
      @subcategory =
        Subcategory.find_by id: params.dig(:q, :product_subcategory_id_eq)
    end

    if @subcategory
      filter = scope.ransack(params[:q].slice(:product_subcategory_id_eq))
    end

    if params.dig(:q, :product_category_id_eq).present?
      @category =
        Category.find_by id: params.dig(:q, :product_category_id_eq)
    end

    if @category
      filter ||= scope.ransack(params[:q].slice(:product_category_id_eq))
    end

    if filter
      price_column = "price_after_discount_#{current_user.currency.downcase}"
      @max_price = filter.result.maximum(price_column).to_f
      @min_price = filter.result.minimum(price_column).to_f
    end
  end
end
