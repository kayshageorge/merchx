PASSWORD = "password"

Product.destroy_all
User.destroy_all

super_user = User.create(
  band_name: "Burger Queen",
  email: "burgerqueen@bands.ca",
  password: PASSWORD,
)

30.times.each do
  band_name = Faker::HitchhikersGuideToTheGalaxy.specie

  u = User.create(
    band_name: band_name,
    email: "#{band_name.strip().downcase}@band.ca",
    password: PASSWORD
  )
  if u.valid?
    rand(0..10).times.each do
      Product.create(
        title: Faker::HitchhikersGuideToTheGalaxy.starship,
        description: Faker::HitchhikersGuideToTheGalaxy.quote,
        user: u
      )
    end
  end
end

users = User.all
products = Product.all

puts "Created #{users.count} users and #{products.count} products. Login with email: #{super_user.email} and password: #{super_user.password}"
