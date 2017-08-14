class Page < ApplicationRecord
  translates :title, :content

  validates :key, uniqueness: true

  class << self

    def about_us
      where(key: 'about_us').first_or_create!
    end

    def terms_and_conditions
      where(key: 'terms_and_conditions').first_or_create!
    end

    def privacy_policy
      where(key: 'privacy_policy').first_or_create!
    end

    def orders_and_returns
      where(key: 'orders_and_returns').first_or_create!
    end

  end
end
