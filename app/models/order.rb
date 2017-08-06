class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  validates_uniqueness_of :uid
  before_create :generate_uid

  accepts_nested_attributes_for :order_items

  before_create :set_total

  def to_param
    uid
  end

  private

  def generate_uid
    self.uid ||=  SecureRandom.hex(8)
  end

  def set_total
    order_items.each(&:calculate_price)
    self.total ||= order_items.map(&:total).sum
  end
end
