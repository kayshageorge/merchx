PASSWORD = "password"

Order.destroy_all
LineItem.destroy_all
Customer.destroy_all
Sku.destroy_all
Product.destroy_all
User.destroy_all

super_user = User.create(
  band_name: "Burger Queen",
  email: "burgerqueen@bands.ca",
  password: PASSWORD,
)

20.times.each do
  band_name = Faker::HitchhikersGuideToTheGalaxy.specie

  u = User.create(
    band_name: band_name,
    email: "#{band_name.strip().downcase}@band.ca",
    password: PASSWORD
  )
  if u.valid?
    rand(0..10).times.each do
      item = Product.create(
        title: Faker::HitchhikersGuideToTheGalaxy.starship,
        description: Faker::HitchhikersGuideToTheGalaxy.quote,
        user: u
      )
      if item.valid?
        sizes = ['l-xs', 'l-sm', 'l-m', 'l-lg', 'l-xl', 'u-xs', 'u-sm', 'u-m', 'u-lg', 'u-xl']

        for size in sizes
          Sku.create(
            product: item,
            size: size,
            price: rand(15..30),
            qty: rand(15..50)
          )
        end
      end
    end
  end
end

users = User.all
products = Product.all
skus = Sku.all

40.times.each do
  custDetails = Faker::RuPaul.queen
  c = Customer.create(
    email: "#{custDetails.strip().downcase}@email.com",
    marketing: Faker::Boolean.boolean(0.5)
  )
  if c.valid?
    rand(1..4).times.each do
      o = Order.create(
        customer: c,
        picked_up: Faker::Boolean.boolean(0.5)
      )
      if o.valid?
        rand(1..5).times.each do
          product_sku = skus.sample
          count = rand(1..2)
          price = product_sku.price * count
          LineItem.create(
            order: o,
            sku: product_sku,
            qty: count,
            total: price
          )
        end
      end
    end
  end
end

customers = Customer.all
orders = Order.all
lineItems = LineItem.all

puts "Created #{users.count} users and #{products.count} products and #{skus.count} skus, as well as #{customers.count} customers with #{orders.count} orders that have #{lineItems.count} lineItems. Login with email: #{super_user.email} and password: #{super_user.password}"
