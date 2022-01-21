# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    Animal.destroy_all
    seed = Seed.new
    seed.generate_pets
  end

  def generate_pets
    20.times do |i|
      pet = Animal.create!(name: Faker::JapaneseMedia::Naruto.character, species: 'cat', age: Faker::Number.between(from: 1, to: 18))
      puts "Cat #{i}: A cat named #{pet.name}, #{pet.age} years old!"
    end
    20.times do |i|
      pet = Animal.create!(name: Faker::JapaneseMedia::DragonBall.character, species: 'dog', age: Faker::Number.between(from: 1, to: 15))
      puts "Dog #{i}: A dog named #{pet.name}, #{pet.age} years old!"
    end
    puts "Created #{Animal.count} new pets!"
  end
end

Seed.begin