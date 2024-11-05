# db/seeds.rb

# Create users
users = []
user_data = [
  { email: "john.doe@example.com", first_name: "John", last_name: "Doe" },
  { email: "jane.smith@example.com", first_name: "Jane", last_name: "Smith" },
  { email: "alex.johnson@example.com", first_name: "Alex", last_name: "Johnson" },
  { email: "lisa.williams@example.com", first_name: "Lisa", last_name: "Williams" },
  { email: "michael.brown@example.com", first_name: "Michael", last_name: "Brown" }
]

user_data.each do |data|
  users << User.create!(
    email: data[:email],
    password: "password",  # Replace with a secure password in production
    first_name: data[:first_name],
    last_name: data[:last_name]
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
pet_data = [
  { name: "Buddy", breed: "Golden Retriever", address: "123 Rue Sainte-Catherine, Montreal, QC", description: "A friendly and energetic dog.", latitude: 45.5051, longitude: -73.5586 },
  { name: "Max", breed: "Bulldog", address: "456 Boulevard Saint-Laurent, Montreal, QC", description: "Loves to nap and eat treats.", latitude: 45.5184, longitude: -73.5733 },
  { name: "Bella", breed: "Beagle", address: "789 Avenue du Mont-Royal E, Montreal, QC", description: "Curious and loves to explore.", latitude: 45.5265, longitude: -73.5855 },
  { name: "Charlie", breed: "Poodle", address: "101 Rue Sherbrooke E, Montreal, QC", description: "Smart and loves to show off tricks.", latitude: 45.5256, longitude: -73.5631 },
  { name: "Lucy", breed: "Labrador", address: "202 Rue Rachel E, Montreal, QC", description: "Very friendly and loves everyone.", latitude: 45.5243, longitude: -73.5820 },
  { name: "Rocky", breed: "German Shepherd", address: "303 Rue Berri, Montreal, QC", description: "Protective and loyal.", latitude: 45.5182, longitude: -73.5649 },
  { name: "Daisy", breed: "Cocker Spaniel", address: "404 Avenue des Pins O, Montreal, QC", description: "Playful and loves water.", latitude: 45.5061, longitude: -73.5881 },
  { name: "Molly", breed: "Siberian Husky", address: "505 Rue Saint-Denis, Montreal, QC", description: "Adventurous and loves to run.", latitude: 45.5201, longitude: -73.5882 },
  { name: "Bailey", breed: "Boxer", address: "606 Rue de la Montagne, Montreal, QC", description: "Energetic and playful.", latitude: 45.4999, longitude: -73.5785 },
  { name: "Sadie", breed: "Shih Tzu", address: "707 Boulevard René-Lévesque O, Montreal, QC", description: "Sweet and loves to be pampered.", latitude: 45.4981, longitude: -73.5730 }
]

pet_data.each do |data|
  user = users.sample  # Randomly select a user for each pet
  Pet.create!(
    name: data[:name],
    breed: data[:breed],
    address: data[:address],
    description: data[:description],
    image_url: dog_images.sample,  # Select a random dog image
    user_id: user.id,
    latitude: data[:latitude],
    longitude: data[:longitude]
  )
end

# Create reservations for the pets
Pet.all.each do |pet|
  Reservation.create!(
    user_id: users.sample.id,  # Randomly assign a user to the reservation
    pet_id: pet.id,  # Corrected to 'pet_id'
    start_date: Date.today + rand(1..30),  # Random start date within the next month
    end_date: Date.today + rand(31..60),  # Random end date after the start date
    status: ["pending", "confirmed", "cancelled"].sample
  )
end

puts "Seeded #{User.count} users, #{Pet.count} pets, and #{Reservation.count} reservations."


# require 'faker'

# # Create users
# users = []
# 5.times do
#   users << User.create(
#     email: Faker::Internet.unique.email,
#     password: "password",  # Replace with a secure password in production
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name
#   )
# end

# # Array of unique dog images
# dog_images = [
#   "https://placedog.net/300/200?random=1",
#   "https://placedog.net/300/200?random=2",
#   "https://placedog.net/300/200?random=3",
#   "https://placedog.net/300/200?random=4",
#   "https://placedog.net/300/200?random=5",
#   "https://placedog.net/300/200?random=6",
#   "https://placedog.net/300/200?random=7",
#   "https://placedog.net/300/200?random=8",
#   "https://placedog.net/300/200?random=9",
#   "https://placedog.net/300/200?random=10"
# ]

# # Create 10 pets associated with the users
# 10.times do
#   user = users.sample  # Randomly select a user for each pet
#   Pet.create(
#     name: Faker::Creature::Dog.name,
#     breed: Faker::Creature::Dog.breed,
#     address: Faker::Address.full_address,
#     description: Faker::Lorem.sentence,
#     image_url: dog_images.sample,  # Select a random dog image
#     user_id: user.id
#   )
# end

# # Create reservations for the pets
# Pet.all.each do |pet|
#   Reservation.create(
#     user_id: users.sample.id,  # Randomly assign a user to the reservation
#     pets_id: pet.id,
#     start_date: Faker::Date.forward(days: 23),
#     end_date: Faker::Date.forward(days: 30),
#     status: ["pending", "confirmed", "cancelled"].sample
#   )
# end

# puts "Seeded #{User.count} users, #{Pet.count} pets, and #{Reservation.count} reservations."