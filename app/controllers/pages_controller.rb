class PagesController < ApplicationController
  def home
    #Filter
    @countries = Customer.distinct.pluck(:country)

    # Total Revenue
    @revenue = Bundle.sum(:price)
    @revenue = Bundle.joins(:customer).where(customer: {country: "France"}).sum(:price) if params[:country].present?

    # Avg rev per order
    @arpo = @revenue / Order.count

    #Total Customers
    @customers = Customer.count
  end
end
