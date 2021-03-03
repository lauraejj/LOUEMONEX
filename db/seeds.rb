# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts 'Start seed'

15.times do |i|
  user = User.create!(
    # name: Faker::Name.name,
    email: "user#{i + 1}@mail.fr",
    password: 'azerty123',
    # description: Faker::TvShows::HowIMetYourMother.quote,
    # age: rand(18..75),
    # admin: false,
    # ville: %w(marseille paris lyon nantes brest strasbourg aix-en-provence nice montpellier avignon dijon lille dunkerque).sample
  )
  puts "User #{user.id}: #{user.email} saved"
end

puts '15 users ok'
puts 'Creating 10 boyfriends'

10.times do |i|
  file = URI.open("https://loremflickr.com/250/150/profile")
  boyfriend = Boyfriend.new(
    name: Faker::Name.name,
    description: "#{Faker::GreekPhilosophers.quote}\n#{Faker::Movie.quote}\n#{Faker::Quote.famous_last_words} ",
    age: rand(18..75)
  )
  # quand plusieurs bf par user modif L36 par L34 / 35
  # u = rand(1..15)
  # user = User.find(u)
  user = User.find(i + 1)
  boyfriend.user = user
  # boyfriend.ville = user.ville
  boyfriend.photos.attach(io: file, filename: 'profil_pic.png', content_type: 'image/png')
  boyfriend.save!
  puts "boyfriend n°#{boyfriend.id} belonging to #{boyfriend.user.email} saved"
end

puts '10 boyfriends ok'
# puts 'creating services'

# liste = ['bricolage', 'menage', 'repassage', 'jardinage', 'garde les enfants', 'cuisine', 'sort le chien/chat', 'peut vous accompagner en soirée']
# liste.each do |tache|
#   Service.create!(
#     category: tache,
#     price: rand(10..130)
#   )
#   puts "#{tache} created"
# end

# puts "#{liste.length} categories/services created"

puts "Users, boyfriends and services create"
