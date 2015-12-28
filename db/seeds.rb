include RandomData

50.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
end

50.times do
  Item.create!(
  name: Faker::Lorem.sentence
  )
end

items = Item.all

puts "Seed finished"
puts "#{Item.count} items created"
