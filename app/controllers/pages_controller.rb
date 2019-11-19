class PagesController < ApplicationController
  def home
    #Filter
    @countries = Customer.distinct.pluck(:country)
    @country = params[:country]

    # Total Revenue
    total_revenue = Bundle.sum(:price)
    if @country.present? && @country != "All"
      @bundle = Bundle.joins(:customers).where(customers: {country: @country})
      total_revenue = @bundle.sum(:price)
    end
    @revenue = total_revenue.to_s

    # Avg rev per order
    arpo = total_revenue / Order.count if Order.count
    arpo = total_revenue / Order.joins(:customer).where(customers: {country: @country}).count if @country.present? && @country != "All"
    @arpo = arpo.to_s

    #Total Customers
    customers = Customer.count
    customers = Customer.where(country: @country).count if @country.present? && @country != "All"
    @customers = customers.to_s
  end
end
