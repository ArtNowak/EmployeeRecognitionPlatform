# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1.upto(5) do |i|
    Employee.create(email: "employee#{i}@test.com", password: 'password')
end

1.upto(4) do |i|
    Kudo.create!(title: "Title#{i}", content: "Content#{i}", giver: Employee.find_by(email: "employee#{i}@test.com"), receiver: Employee.find_by(email: "employee#{i+1}@test.com"))
end

AdminUser.create(email: "admin@test.com", password: 'adminadmin')
