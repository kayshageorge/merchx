PASSWORD = "password"

User.destroy_all

super_user = User.create(
  band_name: "Burger Queen",
  email: "burgerqueen@bands.ca",
  password: PASSWORD,
)

30.times.each do
  band_name = Faker::HitchhikersGuideToTheGalaxy.specie

  User.create(
    band_name: band_name,
    email: "#{band_name.strip().downcase}@band.ca",
    password: PASSWORD
  )
end

users = User.all

puts "Created #{users.count} users. Login with email: #{super_user.email} and password: #{super_user.password}"
