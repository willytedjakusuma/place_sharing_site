# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def create_users
  users = []
  5.times do
    display_name = Faker::Name.unique.name
    users.push({
      display_name: display_name,
      username: Faker::Internet.username(specifier: display_name).gsub(/\W/, ''),
      email: Faker::Internet.email(name: display_name),
      password: Faker::Internet.password,
    })
  end 
  
  File.open('./user_password_list.txt', 'a') do |file|
    users.each do |user|
      file.write(JSON.pretty_generate(user.as_json))
    end
  end

  if User.create!(users)
    puts 'Users created'
  else
    puts 'Create User Error'
  end
end

def create_locations
  locations = []
  10.times do 
    user_id = rand(1..5)
    random_user_ids = (1..5).to_a.shuffle.take(rand(0..4))
    random_user_ids = random_user_ids.reject {|r_id| r_id == user_id }
    locations.push({
      location_name: Faker::Bank.name,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      is_private: [true, false].sample, # random true false
      shared_with: { data: random_user_ids },
      user_id: user_id,
    })
  end
  if Location.create!(locations)
    puts "Locations created"
  else
    puts "Create Location Error"
  end
end

# Seed starts
users = User.all
if users.present?
  puts "Users already seeded"
  location = Location.all
  if location.present?
    puts "Locations already seeded"
  else
    create_locations
  end
else
  create_users
  create_locations
end