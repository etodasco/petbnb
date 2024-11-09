# db/seeds.rb
User.destroy
Pet.destroy
# Array of static dog images
dog_images = [
  "https://placedog.net/300/200",
  "https://placedog.net/300/201",
  "https://placedog.net/300/202",
  "https://placedog.net/300/203",
  "https://placedog.net/300/204",
  "https://placedog.net/300/205",
  "https://placedog.net/300/206",
  "https://placedog.net/300/207",
  "https://placedog.net/300/208",
  "https://placedog.net/300/209"
]

# Sample user to associate with pets
# Replace with actual user ID if needed, or create a default user if none exist.
user = User.first || User.create!(email: "default@example.com", password: "password")

# Define data for 10 pets
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

# Create pets
pet_data.each_with_index do |data, index|
  Pet.create!(
    name: data[:name],
    breed: data[:breed],
    address: data[:address],
    description: data[:description],
    image_url: dog_images[index],  # Assign each pet a unique static image
    user_id: user.id,  # Associate with the sample user
    latitude: data[:latitude],
    longitude: data[:longitude]
  )
end

puts "Seeded #{Pet.count} pets."
