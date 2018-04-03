PASSWORD = "password"

Order.destroy_all
LineItem.destroy_all
Customer.destroy_all
Sku.destroy_all
Product.destroy_all
User.destroy_all

super_user = User.create(
  band_name: "Belle and Sebastian",
  email: "belleandseb@bands.ca",
  password: PASSWORD,
)



bellensebImages = ["https://cdn.shopify.com/s/files/1/1281/3519/products/Screen_Shot_2018-01-29_at_16.00.58_1024x1024.png?v=1517241862", "https://cdn.shopify.com/s/files/1/1281/3519/products/Screen_Shot_2018-01-29_at_15.29.43_1024x1024.png?v=1517240022", "https://cdn.shopify.com/s/files/1/1281/3519/products/Ladies_crest_1024x1024.jpg?v=1462893324", "https://cdn.shopify.com/s/files/1/1281/3519/products/Screen_Shot_2018-01-29_at_16.01.12_1024x1024.png?v=1517241779", "https://cdn.shopify.com/s/files/1/1281/3519/products/Screen_Shot_2018-01-25_at_16.00.40_1024x1024.png?v=1516896905", "https://cdn.shopify.com/s/files/1/1281/3519/products/Stow_1_1024x1024.jpg?v=1475158545", "https://cdn.shopify.com/s/files/1/1281/3519/products/Screen_Shot_2018-01-25_at_16.00.51_1024x1024.png?v=1516896455", "https://cdn.shopify.com/s/files/1/1281/3519/products/men_dancing_bear_1024x1024.jpg?v=1462892446"]

for image in bellensebImages
  item = Product.create(
    title: Faker::Book.title,
    description: Faker::HitchhikersGuideToTheGalaxy.quote,
    user: super_user,
    images: image,
    price: rand(15..30)
  )
  if item.valid?
    sizes = ['l-xs', 'l-sm', 'l-m', 'l-lg', 'l-xl', 'u-xs', 'u-sm', 'u-m', 'u-lg', 'u-xl']

    for size in sizes
      Sku.create(
        product: item,
        size: size,
        qty: rand(0..8)
      )
    end
  end
end

super_user2 = User.create(
  band_name: "Hiatus Kaiyote",
  email: "hiatuskaiyote@bands.ca",
  password: PASSWORD,
)



hiatusImages = ["http://hiatuskaiyote.aracastores.com/media/catalog/product/cache/12/image/9df78eab33525d08d6e5fb8d27136e95/h/s/hsk-tee-wht-01.png", "http://hiatuskaiyote.aracastores.com/media/catalog/product/cache/12/image/9df78eab33525d08d6e5fb8d27136e95/h/s/hsk-tee-gry-02.png", "http://hiatuskaiyote.aracastores.com/media/catalog/product/cache/12/image/9df78eab33525d08d6e5fb8d27136e95/h/s/hsk-tee-blk-02.png", "http://hiatuskaiyote.aracastores.com/media/catalog/product/cache/12/image/9df78eab33525d08d6e5fb8d27136e95/h/s/hsk-tee-blk-01.png"]

for image in hiatusImages
  item = Product.create(
    title: Faker::Book.title,
    description: Faker::HitchhikersGuideToTheGalaxy.quote,
    user: super_user2,
    images: image,
    price: rand(15..30)
  )
  if item.valid?
    sizes = ['l-xs', 'l-sm', 'l-m', 'l-lg', 'l-xl', 'u-xs', 'u-sm', 'u-m', 'u-lg', 'u-xl']

    for size in sizes
      Sku.create(
        product: item,
        size: size,
        qty: rand(0..5)
      )
    end
  end
end

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
        user: u,
        images: Faker::Placeholdit.image("50x50", 'jpg'),
        price: rand(15..30)
      )
      if item.valid?
        sizes = ['l-xs', 'l-sm', 'l-m', 'l-lg', 'l-xl', 'u-xs', 'u-sm', 'u-m', 'u-lg', 'u-xl']

        for size in sizes
          Sku.create(
            product: item,
            size: size,
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

100.times.each do
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
          price = product_sku.product.price * count
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
