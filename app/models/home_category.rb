class HomeCategory < ApplicationRecord
  belongs_to :home_config
  belongs_to :category
end
