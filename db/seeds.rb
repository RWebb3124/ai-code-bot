# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts "cleaning database..."
User.destroy_all
Challenge.destroy_all

puts "creating users..."
5.times do
  first_name = Faker::Name.first_name
  User.create!(first_name: first_name , last_name: Faker::Name.last_name , username: Faker::Name.middle_name , email: Faker::Internet.email(name: first_name), password: "password" )
end
puts "users created!"

puts "creating challenges..."
modules = %w[Ruby Javascript CSS HTML Database]
SYSTEM_PROMPT = "You are a Teaching Assistant. I am a beginner in web development, learning how to code. Help me break down my problem into small, actionable steps, without giving away solutions. Answer concisely in Markdown."
x = 0
5.times do
  Challenge.create!(name: "#{modules[x]} basics - 01", module: modules[x], content: Faker::Lorem.paragraph(sentence_count: 4), system_prompt: SYSTEM_PROMPT)
  x += 1
end
puts "finished creating challenges!"
