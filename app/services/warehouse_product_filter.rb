class WarehouseProductFilter
  def initialize user, params
    @user = user
    @hotel = user.hotel
    @sort_column = params[:sort_column].presence
    @sort_type = params[:sort_type] == "asc" ? "ASC" : "DESC"
    @search = params[:search].presence
    @supplier_ids = params[:supplier_ids].presence
    @brand_ids = params[:brand_ids].presence
    @collection_ids = params[:collection_ids].presence
    @page = params[:page].presence
    @per_page = params[:per_page].presence
    @min_price, @max_price = params[:amount_range].to_s
      .gsub("$", "").split(" - ")
  end

  attr_reader :search, :supplier_ids, :brand_ids, :collection_ids,
    :hotel, :page, :per_page, :sort_type, :sort_column, :min_price, :max_price

  def filter
    warehouse_products =
      WarehouseProduct
        .joins(:product)
        .where(warehouse: hotel.location.warehouses)
        .where("chain_id IS NULL OR chain_id = ?", hotel.chain_id)
    where_conditions = []
    if search
      where_conditions << ["products.name LIKE ?", "%#{search}%"]
    end

    if supplier_ids
      where_conditions << [{products: {supplier_id: supplier_ids}}]
    end

    if brand_ids
      where_conditions << [{products: {brand_id: brand_ids}}]
    end

    if collection_ids
      where_conditions << [{products: {collection_id: collection_ids}}]
    end

    if min_price && max_price
      where_conditions << [
        "warehouse_products.price BETWEEN ? AND ?", min_price.to_i, max_price.to_i
      ]
    end

    where_conditions.each do |condition|
      warehouse_products = warehouse_products.where(*condition)
    end
    sort(warehouse_products).page(page).per(per_page)
  end

  private

  def sort warehouse_products
    case sort_column
    when "name"
      warehouse_products.order("products.name #{sort_type}")
    when "price"
      warehouse_products.order("warehouse_products.price #{sort_type}")
    else
      warehouse_products
    end
  end
end
