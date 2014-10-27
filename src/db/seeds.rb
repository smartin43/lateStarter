# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create({ username: 'admin',
                    first_name: "John",
                     last_name: "Doe",
                      password: 'pass',
         password_confirmation: 'pass',
                        access: 1 })

10.times do |i|
  User.create({ username: "user_#{i}",
              first_name: "first_#{i}",
               last_name: "last_#{i}",
                password: 'pass',
   password_confirmation: 'pass',
                  access: 2 })
end
