# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

subscribers = [
  'doleebear@gmail.com',
  'doleebear+001@gmail.com',
  'doleebear+002@gmail.com',
  'doleebear+003@gmail.com',
  'doleebear+004@gmail.com',  
  'doleebear+005@gmail.com'
]


subscribers.each do |email|
  Newsletter.create(email: email)
end

puts "subsribers created"

5.times do |count|
  User.create(
    email: "test#{count}@test.com",
    username: "test#{count}",
    password: "test12345"
  )
end

puts "users created"

#create 20 recipes
User.all.each do |user|
  20.times do |count|
    user.recipes.create(
      { 'name' => "Sample Recipe #{count}", 'img_url' => 'sample.jpg', 'video_url' => 'https://www.youtube.com/embed/m6jkzIHMEdg', 'instructions' => 'sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1' }
    )
  end
end

puts "users recipes created"