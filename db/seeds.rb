# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Bicycle.count == 0
  5.times do |_i|
    Bicycle.create(name: "Bicycle ##{_i + 1}", description: "Bicycle ##{_i + 1} Description", price: (100 * (_i + 1)), 
                   style: "Bicycle ##{_i + 1} Style", photo: File.open(Rails.root + ("app/assets/images/img-#{_i + 1}.png")))
  end
end

if AdminUser.count == 0
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end