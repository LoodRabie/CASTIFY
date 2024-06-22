# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Clearing existing data..."
User.destroy_all
Dancer.destroy_all
Producer.destroy_all

puts "Creating users, dancers, and producer..."

# South African locations
sa_locations = ["Cape Town", "Johannesburg", "Durban", "Pretoria", "Port Elizabeth"]

# Dancers
5.times do |i|
  user = User.create!(
    email: "dancer#{i + 1}@example.com",
    password: "password123",
    role: "dancer"
  )

  user.create_dancer!(
    name: "Dancer #{i + 1}",
    age: rand(18..40),
    location: sa_locations[i],
    bio: "Professional dancer specializing in #{['contemporary', 'ballet', 'hip-hop', 'jazz', 'African'].sample} with #{rand(1..20)} years of experience."
  )
end

# Producer
producer_user = User.create!(
  email: "producer@example.com",
  password: "password123",
  role: "producer"
)

producer_user.create_producer!(
  name: "South African Dance Productions",
  bio: "Leading dance production company based in Johannesburg, showcasing the best of South African talent."
)

puts "Seed data created successfully!"
puts "Created #{Dancer.count} dancers and #{Producer.count} producer."
