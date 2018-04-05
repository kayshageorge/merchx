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

sizes = ['l-xs', 'l-sm', 'l-m', 'l-lg', 'l-xl', 'u-xs', 'u-sm', 'u-m', 'u-lg', 'u-xl']

one = Product.create(
  title: "Navy 'Grow'",
  description: "Navy cotton T-shirt featuring contrasting red lettering and flowers reaching skywards! The shirt is 100% cotton by Fairwear, providing ethical trade and justice for workers.",
  user: super_user,
  images: "https://cdn.shopify.com/s/files/1/1281/3519/products/Screen_Shot_2018-01-29_at_16.00.58_1024x1024.png?v=1517241862",
  price: 25
)

if one.valid?
 for size in sizes
   Sku.create(
     product: one,
     size: size,
     qty: rand(0..2)
   )
 end
end

two = Product.create(
  title: "Red 'Couple'",
  description: "Burgundy T-shirt with a reprise of one of our favourite designs from the archives! The shirt is 100% cotton by Fairwear, providing ethical trade and justice for workers.",
  user: super_user,
  images:"https://cdn.shopify.com/s/files/1/1281/3519/products/Screen_Shot_2018-01-29_at_15.29.43_1024x1024.png?v=1517240022",
  price: 30
)

if two.valid?
 for size in sizes
   Sku.create(
     product: two,
     size: size,
     qty: rand(0..3)
   )
 end
end

three = Product.create(
  title: "Grey 'Dancing Bears'",
  description: "We're feeling retro-modern with this colourful graphic equaliser design. The dancing bears, as drawn by Kat Heath for the album artwork and inspired by the projections in the Party Line live performance, adorn these black 100% cotton t-shirts. The shirt is EarthPositive, manufactured solely using renewable green energy from wind and solar power.",
  user: super_user,
  images:"https://cdn.shopify.com/s/files/1/1281/3519/products/men_dancing_bear_1024x1024.jpg?v=1462892446",
  price: 20
)

if three.valid?
 for size in sizes
   Sku.create(
     product: three,
     size: size,
     qty: rand(0..4)
   )
 end
end

four = Product.create(
  title: "Blue 'Grow'",
  description: "blue cotton T-shirt featuring contrasting red lettering and flowers reaching skywards! The shirt is 100% cotton by Fairwear, providing ethical trade and justice for workers.",
  user: super_user,
  images:"https://cdn.shopify.com/s/files/1/1281/3519/products/Screen_Shot_2018-01-29_at_16.01.12_1024x1024.png?v=1517241779",
  price: 20
)

if four.valid?
 for size in sizes
   Sku.create(
     product: four,
     size: size,
     qty: rand(0..5)
   )
 end
end

five = Product.create(
  title: "Black 'Space'",
  description: "A nebula-esque design for the dedicated Belle's fan! This screen printed black cotton T-shirt features a rolled sleeve",
  user: super_user,
  images:"https://cdn.shopify.com/s/files/1/1281/3519/products/Screen_Shot_2018-01-25_at_15.46.20_1024x1024.png?v=1516895865",
  price: 20
)

if five.valid?
 for size in sizes
   Sku.create(
     product: five,
     size: size,
     qty: rand(0..8)
   )
 end
end

six = Product.create(
  title: "Grey 'Fox In The Snow'",
  description: "T-shirt with the classic and much loved 'fox in the snow' design by Manny Silva.",
  user: super_user,
  images:"https://cdn.shopify.com/s/files/1/1281/3519/products/Belle_Jpegs22_copy_1024x1024.jpg?v=1477922317",
  price: 25
)

if six.valid?
 for size in sizes
   Sku.create(
     product: six,
     size: size,
     qty: rand(0..8)
   )
 end
end

seven = Product.create(
  title: "White 'Album Crest'",
  description: "We're channeling the 1940s with this kitsch wartime-esque design. 'Girls in Peacetime Want to Dance' is in old fashioned italics, with Tamzin from the album cover art inside a vintage floral crest. The shirt is 100% cotton by Fairwear, providing ethical trade and justice for workers.",
  user: super_user,
  images:"https://cdn.shopify.com/s/files/1/1281/3519/products/MENS_crest1_1024x1024.jpg?v=1462893284",
  price: 30
)

if seven.valid?
 for size in sizes
   Sku.create(
     product: seven,
     size: size,
     qty: rand(0..8)
   )
 end
end

eight = Product.create(
  title: "Blue 'Study at Stow'",
  description: "Continuing our celebration of the band's Tigermilk & Sinister 20th Anniversary, we're bringing back some classic b&s merch designs from the early years. This t-shirt is 'Salvage' meaning that it's is 100% recycled. (60% Recycled pre-consumer organically grown cotton, 40% Recycled post consumer polyester)",
  user: super_user,
  images:"https://cdn.shopify.com/s/files/1/1281/3519/products/Stow_1_1024x1024.jpg?v=1475158545",
  price: 30
)

if eight.valid?
 for size in sizes
   Sku.create(
     product: eight,
     size: size,
     qty: rand(0..8)
   )
 end
end




puts "Login with email: #{super_user.email} and password: #{super_user.password}"
