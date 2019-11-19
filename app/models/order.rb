class Order < ApplicationRecord
  belongs_to :customer
  has_many :bundles
  attr_reader :bundles

  def revenue
    revenue = 0
    @bundles.each do |bundle|
      revenue += bundle.product.unit_price * bundle.quantity
    end
    return revenue
  end
end
