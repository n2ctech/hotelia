class Page < ApplicationRecord
  translates :title, :content

  validates :key, uniqueness: true

  class << self

    def about_us
      first_or_create! key: 'about_us'
    end

  end
end
