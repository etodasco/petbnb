
# db/seeds.rb
User.destroy_all
Pet.destroy_all
# Array of static dog images
pet_images = [
  "https://placedog.net/300/200",
  "https://placedog.net/300/201",
  "https://placedog.net/300/202",
  "https://placedog.net/300/203",
  "https://placedog.net/300/204",
  "https://placedog.net/300/205",
  "https://placedog.net/300/206",
  "https://placedog.net/300/207",
  "https://placedog.net/300/208",
  "https://placedog.net/300/209
]

# Sample user to associate with pets (or create a default user if none exist)
user = User.first || User.create!(email: "default@example.com", password: "password")

# Define data for 10 dogs
pet_data = [
  # Dogs
  { name: "Scout", breed: "Golden Retriever", address: "123 Rue Sainte-Catherine, Montreal, QC", description: "A friendly and energetic dog.", latitude: 45.5051, longitude: -73.5586, species: "dog", start_date: "2024-11-01", end_date: "2024-11-15" },
  { name: "Max", breed: "Bulldog", address: "456 Boulevard Saint-Laurent, Montreal, QC", description: "Loves to nap and eat treats.", latitude: 45.5184, longitude: -73.5733, species: "dog", start_date: "2024-11-05", end_date: "2024-11-20" },
  { name: "Bella", breed: "Beagle", address: "789 Avenue du Mont-Royal E, Montreal, QC", description: "Curious and loves to explore.", latitude: 45.5265, longitude: -73.5855, species: "dog", start_date: "2024-11-10", end_date: "2024-11-25" },
  { name: "Charlie", breed: "Poodle", address: "101 Rue Sherbrooke E, Montreal, QC", description: "Smart and loves to show off tricks.", latitude: 45.5256, longitude: -73.5631, species: "dog", start_date: "2024-11-12", end_date: "2024-11-30" },
  { name: "Lucy", breed: "Labrador", address: "202 Rue Rachel E, Montreal, QC", description: "Very friendly and loves everyone.", latitude: 45.5243, longitude: -73.5820, species: "dog", start_date: "2024-11-15", end_date: "2024-12-01" },
  { name: "Rocky", breed: "German Shepherd", address: "303 Rue Berri, Montreal, QC", description: "Protective and loyal.", latitude: 45.5182, longitude: -73.5649, species: "dog", start_date: "2024-11-20", end_date: "2024-12-05" },
  { name: "Daisy", breed: "Cocker Spaniel", address: "404 Avenue des Pins O, Montreal, QC", description: "Playful and loves water.", latitude: 45.5061, longitude: -73.5881, species: "dog", start_date: "2024-11-25", end_date: "2024-12-10" },
  { name: "Molly", breed: "Siberian Husky", address: "505 Rue Saint-Denis, Montreal, QC", description: "Adventurous and loves to run.", latitude: 45.5201, longitude: -73.5882, species: "dog", start_date: "2024-11-28", end_date: "2024-12-15" },
  { name: "Bailey", breed: "Boxer", address: "606 Rue de la Montagne, Montreal, QC", description: "Energetic and playful.", latitude: 45.4999, longitude: -73.5785, species: "dog", start_date: "2024-12-01", end_date: "2024-12-20" },
  { name: "Sadie", breed: "Shih Tzu", address: "707 Boulevard René-Lévesque O, Montreal, QC", description: "Sweet and loves to be pampered.", latitude: 45.4981, longitude: -73.5730, species: "dog", start_date: "2024-12-05", end_date: "2024-12-25" },
]


availability_dates = [
  { available_from: '2024-11-01', available_until: '2024-11-15' },
  { available_from: '2024-11-05', available_until: '2024-11-20' },
  { available_from: '2024-11-10', available_until: '2024-11-25' },
  { available_from: '2024-11-12', available_until: '2024-11-30' },
  { available_from: '2024-11-15', available_until: '2024-12-01' },
  { available_from: '2024-11-20', available_until: '2024-12-05' },
  { available_from: '2024-11-25', available_until: '2024-12-10' },
  { available_from: '2024-11-28', available_until: '2024-12-15' },
  { available_from: '2024-12-01', available_until: '2024-12-20' },
  { available_from: '2024-12-05', available_until: '2024-12-25' },
]

=======
]


availability_dates = [
  { available_from: '2024-11-01', available_until: '2024-11-15' },
  { available_from: '2024-11-05', available_until: '2024-11-20' },
  { available_from: '2024-11-10', available_until: '2024-11-25' },
  { available_from: '2024-11-12', available_until: '2024-11-30' },
  { available_from: '2024-11-15', available_until: '2024-12-01' },
  { available_from: '2024-11-20', available_until: '2024-12-05' },
  { available_from: '2024-11-25', available_until: '2024-12-10' },
  { available_from: '2024-11-28', available_until: '2024-12-15' },
  { available_from: '2024-12-01', available_until: '2024-12-20' },
  { available_from: '2024-12-05', available_until: '2024-12-25' },
]
# Create pet
pet_data.each_with_index do |data, index|
  pet = Pet.create!(
    name: data[:name],
    breed: data[:breed],
    address: data[:address],
    description: data[:description],
    image_url: pet_images[index],  # Assign each pet a unique static image
    user_id: user.id,  # Associate with the sample user
    latitude: data[:latitude],
    longitude: data[:longitude],
    start_date: availability_dates[index][:available_from],
    end_date: availability_dates[index][:available_until]
  )
  puts "Created pet: #{pet.name}, available from #{pet.start_date} to #{pet.end_date}"
end
puts "Number of pets: #{pet_data.count}"
puts "Number of availability dates: #{availability_dates.count}"

if pet_data.count != availability_dates.count
  puts "Warning: Pet data and availability dates do not match in number!"

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

# puts "Seeded #{User.count} users, #{Pet.count} pets, and #{Reservation.count} reservations

