# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.all
users_id_array = Array.new
for i in 0...User.all.length
    users_id_array[i] = users[i].id
end

categories = Category.all
categories_id_array = Array.new
for i in 0...Category.all.length
    categories_id_array[i] = categories[i].id
end

30.times do
    Vehicle.create([{
        title: Faker::Vehicle.car_type,
        description: Faker::Vehicle.standard_specs,
        price: rand(3000.0..10000.00).round(2),
        category_ids: rand(categories_id_array.min..categories_id_array.max),
        company: Faker::Vehicle.make,
        user_id: rand(users_id_array.min..users_id_array.max)
    }])
end
