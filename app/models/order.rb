class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  validates_uniqueness_of :uid
  validates :order_items, presence: true
  enum currency: {
    EUR: "EUR",
    USD: "USD",
    CVE: "CVE"
  }

  validates :type, inclusion: { in: [nil, 'QuoteOrder'] }

  accepts_nested_attributes_for :order_items, reject_if: :all_blank,
    allow_destroy: true

  before_create :generate_uid
  before_save :set_total

  default_scope { where(type: nil) }

  private

  def generate_uid
    self.uid ||=  SecureRandom.hex(8)
  end

  def set_total
    order_items.each &:calculate_total
    if order_items.any?{|item| item.total == 0}
      self.items_total = 0
      self.total =  0
    else
      self.items_total = order_items.map(&:total).sum
      self.total =  items_total + adjustment_total
    end
  end
end
