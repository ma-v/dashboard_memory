class PagesController < ApplicationController
  def home
    #Filter
    @countries = Customer.distinct.pluck(:country)
    @country = params[:country]

    #Format numbers
    def round_number(number)
      num = number.to_s
      if num.length < 4
        return num
      elsif num.length < 7
        return "#{(num[0...-2].to_f / 10).to_s} K"
      else
        return "#{(num[0...-5].to_f / 10).to_s} M"
      end
    end

    # Total Revenue
    total_revenue = Bundle.sum(:price)
    if @country.present? && @country != "All"
      @bundle = Bundle.joins(:customers).where(customers: {country: @country})
      total_revenue = @bundle.sum(:price)
    end
    @revenue = round_number(total_revenue)

    # Avg rev per order
    arpo = 0
    arpo = total_revenue / Order.count if Order.count
    arpo = total_revenue / Order.joins(:customer).where(customers: {country: @country}).count if @country.present? && @country != "All"
    @arpo = round_number(arpo)

    #Total Customers
    customers = Customer.count
    customers = Customer.where(country: @country).count if @country.present? && @country != "All"
    @customers = round_number(customers)
  end
end
