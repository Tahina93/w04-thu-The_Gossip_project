# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

City.destroy_all
10.times do
  City.create(
    name: Faker::Games::Fallout.location,
    zip_code: Faker::Address.zip
  )
end

first_city_id = City.first.id
last_city_id = City.last.id

User.destroy_all
10.times do
  User.create(
    first_name: Faker::Movies::LordOfTheRings.character,
    last_name: Faker::Movies::StarWars.planet,
    description: Faker::TvShows::BojackHorseman.quote,
    email: Faker::Internet.email,
    age: rand(18..99),
    city: City.find(rand(first_city_id..last_city_id))
  )
end

first_user_id = User.first.id
last_user_id = User.last.id

Gossip.destroy_all
20.times do
  Gossip.create(
    title: Faker::Book.title,
    content: Faker::Movie.quote + ". " + Faker::Movies::StarWars.quote,
    user: User.find(rand(first_user_id..last_user_id))
  )
end

first_gossip_id = Gossip.first.id
last_gossip_id = Gossip.last.id

Tag.destroy_all
10.times do
  Tag.create(title: "#" + Faker::Cannabis.buzzword.gsub(/ /, "_"))
end

first_tag_id = Tag.first.id
last_tag_id = Tag.last.id

TagGossipLink.destroy_all
Gossip.all.each do |gossip|
  puts gossip
  puts tag = Tag.find(rand(first_tag_id..last_tag_id))
  TagGossipLink.create(gossip: gossip, tag: tag)
end

rand(0..20).times do
  TagGossipLink.create(
    gossip: Gossip.find(rand(first_gossip_id..last_gossip_id)),
    tag: Tag.find(rand(first_tag_id..last_tag_id))
  )
end