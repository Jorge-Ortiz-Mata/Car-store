# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do
    Vehicle.create!([{
        title: Faker::Vehicle.car_type,
        description: Faker::Vehicle.standard_specs,
        price: rand(3000.0..10000.00).round(2),
        category_ids: rand(1..6),
        company: Faker::Vehicle.make,
        user_id: rand(5..11)
    }])
end
