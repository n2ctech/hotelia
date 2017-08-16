class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :hotel
  has_many :cart_items
  has_many :orders
  has_many :quote_orders

  EUR = "EUR"
  USD = "USD"
  CVE = "CVE"

  validates :locale, inclusion: { in: %w(en es pt) }
  validates :currency, inclusion: { in: %w(EUR USD CVE) }

  delegate :name, to: :hotel

  accepts_nested_attributes_for :cart_items

  def flag
    case locale
    when 'en'
      'gb'
    when 'es'
      'es'
    when 'pt'
      'pt'
    end
  end
end
