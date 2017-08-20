class HomeProduct < ApplicationRecord
  belongs_to :product
  belongs_to :home_config
end
