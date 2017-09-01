class WarehouseProduct < ApplicationRecord
  paginates_per 15

  belongs_to :warehouse
  belongs_to :product
  belongs_to :chain, optional: true

  validates :price_eur, :price_usd, :price_cve, presence: true

  validates_uniqueness_of :product_id, scope: [:warehouse_id, :chain_id]
  validates_numericality_of :price_eur, :price_usd, :price_cve, :stock,
    :discount_eur, :discount_usd, :discount_cve,
    greater_than_or_equal_to: 0, allow_blank: true

  before_save :set_price_after_discount

  delegate :name, :description, :first_image, to: :product, prefix: true
  delegate :brand_name, to: :product

  scope :matches_all_tags, -> *tag_ids { where(matches_all_tags_arel(tag_ids)) }

  def self.matches_all_tags_arel(tag_ids)
    tag_ids = tag_ids.map(&:presence).compact
    warehouse_products = Arel::Table.new(:warehouse_products)
    products = Arel::Table.new(:products)
    tags = Arel::Table.new(:tags)
    products_tags = Arel::Table.new(:products_tags)

    warehouse_products[:id].in(
      warehouse_products.project(warehouse_products[:id])
        .join(products).on(products[:id].eq(warehouse_products[:product_id]))
        .join(products_tags).on(products[:id].eq(products_tags[:product_id]))
        .join(tags).on(products_tags[:tag_id].eq(tags[:id]))
        .where(tags[:id].in(tag_ids))
        .group(warehouse_products[:id])
        .having(tags[:id].count.eq(tag_ids.length))
    )
  end

  def self.ransackable_scopes(auth_object = nil)
    super + %w(matches_all_tags)
  end

  def price_after_discount currency
    if support_currency?(currency)
      send("price_after_discount_#{currency.downcase}").to_f
    else
      price_after_discount_eur
    end
  end

  def support_currency? currency
    send("price_after_discount_#{currency.downcase}").to_f > 0
  end

  def name
    "#{warehouse.name} - #{product.name}"
  end

  private
  def set_price_after_discount
    self.price_after_discount_eur = price_eur - discount_eur.to_f
    self.price_after_discount_usd = price_usd - discount_usd.to_f
    self.price_after_discount_cve = price_cve - discount_usd.to_f
  end
end
