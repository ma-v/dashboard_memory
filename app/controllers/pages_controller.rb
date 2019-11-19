class PagesController < ApplicationController
  def home
    @bundles = Bundle.all
    @products = Product.all
    @customers = Customer.all
    @orders = Order.all

    # Total Revenue
    bundle_revenue_array = @bundles.map {|bundle| bundle.quantity * bundle.product.unit_price}
    @revenue = bundle_revenue_array.inject(0){|sum,x| sum + x }

    # Avg rev per order
    @arpo = @revenue / Order.count
  end
end
