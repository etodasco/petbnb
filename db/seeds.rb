# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user1 = User.create(
  #name: 'petlover1',
  email: 'petlover1@example.com',
  password: 'password123'

)

user2 = User.create(
  #name: 'catmom23',
  email: 'catmom23@example.com',
  password: 'password123'
)


pet1 = Pet.create(
  name: 'Ronald',
  breed: 'Golden Retriever',
  age: 3,
  address:1855 Griffin Rd, Dania Beach, FL 33004, USA
  description: 'Meet Ronald, a spirited 3-year-old Golden Retriever with a heart of gold.'
  user: user1
)

pet2 = Pet.create(
  name: 'Fendi',
  breed: 'Siamese Cat',
  age: 2,
  address: 3450 W. 3rd St, Los Angeles, CA 90020, USA
  description:'Fendi is a playful and curious 2-year-old Siamese cat with striking blue eyes.'
  user: user2
)

pet3 = Pet.create(
  name: 'Max',
  breed: 'Pitbull',
  age: 5,
  address: 2500 E. Sunrise Blvd, Fort Lauderdale, FL 33304, USA
  description:'Max is a gentle and loving 5-year-old Pitbull with a big heart.'
  user: user1
)
