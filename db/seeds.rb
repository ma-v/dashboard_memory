require 'csv'

puts 'Cleaning database...'
Bundle.destroy_all
Order.destroy_all
Customer.destroy_all
Product.destroy_all

puts 'Creating Instances'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'memory-tech-challenge-data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv[0..20].each do |row|
  customer = Customer.where(customer_id: row['customer_id']).first_or_initialize
  customer.country = row['country']
  customer.save
  product = Product.where(product_code: row['product_code']).first_or_initialize
  product.product_description = row['product_description']
  product.product_description = row['product_description']
  product.unit_price = row['unit_price']
  product.save
  order = Order.where(order_id: row['order_id']).first_or_initialize
  order.order_date = row['date']
  order.customer = customer
  order.save
  bundle = Bundle.new
  bundle.quantity = row['quantity']
  bundle.order = order
  bundle.product = product
  bundle.save
  puts "saved"
end

puts "#{Customer.count} customers created, #{Product.count} products created, #{Bundle.count} bundles created, #{Order.count} orders created "
