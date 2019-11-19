class PagesController < ApplicationController
  def home
    # Total Revenue
    @revenue = Bundle.total_revenue

    # Avg rev per order
    @arpo = @revenue / Order.size

    #Total Customers
    @customers = Customer.size
  end
end
