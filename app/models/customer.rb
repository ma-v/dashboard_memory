class Customer < ApplicationRecord
  has_many :orders
  # has_many :bundles, through: :orders
end
