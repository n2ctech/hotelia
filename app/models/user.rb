class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :hotel
  has_many :cart_items

  validates :locale, inclusion: { in: %w(en es pt) }
  validates :currency, inclusion: { in: %w(EUR USD CVE) }

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
