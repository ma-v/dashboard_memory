require 'csv'

puts 'Cleaning database...'
# Bundle.delete_all
# Order.delete_all
# Customer.delete_all
# Product.delete_all

puts 'Creating Instances'
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'memory-tech-challenge-data.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv[373820..-1].each do |row|
#   customer = Customer.where(customer_id: row['customer_id']).first_or_initialize
#   customer.country = row['country']
#   customer.save
#   product = Product.where(product_code: row['product_code']).first_or_initialize
#   product.product_description = row['product_description']
#   product.unit_price = row['unit_price']
#   product.save
#   order = Order.where(order_id: row['order_id']).first_or_initialize
#   order.order_date = row['date']
#   order.customer = customer
#   order.save
#   bundle = Bundle.new
#   bundle.quantity = row['quantity']
#   bundle.order = order
#   bundle.product = product
#   bundle.price = bundle.quantity * bundle.product.unit_price
#   bundle.save
# end
  customer = Customer.where(customer_id: "16805").first_or_initialize
  customer.country = "United Kingdom"
  customer.save
  product = Product.where(product_code: "21248").first_or_initialize
  product.product_description = "DOOR HANGER  MUM + DADS ROOM"
  product.unit_price = 1.45
  product.save
  order = Order.where(order_id: "538853").first_or_initialize
  order.order_date = "14/12/2010 13:35"
  order.customer = customer
  order.save
  bundle = Bundle.new
  bundle.quantity = 1
  bundle.order = order
  bundle.product = product
  bundle.price = bundle.quantity * bundle.product.unit_price
  bundle.save

  customer2 = Customer.where(customer_id: "13654").first_or_initialize
  customer2.country = "United Kingdom"
  customer2.save
  product2 = Product.where(product_code: "20725").first_or_initialize
  product2.product_description = "LUNCH BAG RED RETROSPOT"
  product2.unit_price = 1.65
  product2.save
  order2 = Order.where(order_id: "549711").first_or_initialize
  order2.order_date = "11/04/2011 14:07"
  order2.customer = customer2
  order2.save
  bundle2 = Bundle.new
  bundle2.quantity = 10
  bundle2.order = order2
  bundle2.product = product2
  bundle2.price = bundle2.quantity * bundle2.product.unit_price
  bundle2.save

puts "#{Customer.count} customers created, #{Product.count} products created, #{Bundle.count} bundles created, #{Order.count} orders created "
