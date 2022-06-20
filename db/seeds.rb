
puts "Creating seeds"
Service.destroy_all

User.create(
  email: "test@gmail.com",
  password: 'password')
15.times do
  Service.create(
    title: Faker::Company.name,
    description: Faker::Marketing.buzzwords,
    cost: "#{rand(1..300)}",
    average_rating: rand(1..5),
    category: Faker::Job.field,
    user_id: 1)
end

puts "Finished creating seeds"
