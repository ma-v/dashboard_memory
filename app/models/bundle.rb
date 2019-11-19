class Bundle < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def self.total_revenue
    bundle_revenue_array = Bundle.all.map {|bundle| bundle.quantity * bundle.product.unit_price}
    return bundle_revenue_array.inject(0){|sum,x| sum + x }
  end
end
