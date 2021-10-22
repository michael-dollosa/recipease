# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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