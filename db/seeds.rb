require 'faker'

# Create users
users = []
5.times do
  users << User.create(
    email: Faker::Internet.unique.email,
    password: "password",  # Replace with a secure password in production
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

# Array of unique dog images
dog_images = [
  "https://placedog.net/300/200?random=1",
  "https://placedog.net/300/200?random=2",
  "https://placedog.net/300/200?random=3",
  "https://placedog.net/300/200?random=4",
  "https://placedog.net/300/200?random=5",
  "https://placedog.net/300/200?random=6",
  "https://placedog.net/300/200?random=7",
  "https://placedog.net/300/200?random=8",
  "https://placedog.net/300/200?random=9",
  "https://placedog.net/300/200?random=10"
]

# Create 10 pets associated with the users
10.times do
  user = users.sample  # Randomly select a user for each pet
  Pet.create(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    address: Faker::Address.full_address,
    description: Faker::Lorem.sentence,
    image_url: dog_images.sample,  # Select a random dog image
    user_id: user.id
  )
end

# Create reservations for the pets
Pet.all.each do |pet|
  Reservation.create(
    user_id: users.sample.id,  # Randomly assign a user to the reservation
    pets_id: pet.id,
    start_date: Faker::Date.forward(days: 23),
    end_date: Faker::Date.forward(days: 30),
    status: ["pending", "confirmed", "cancelled"].sample
  )
end

puts "Seeded #{User.count} users, #{Pet.count} pets, and #{Reservation.count} reservations."
