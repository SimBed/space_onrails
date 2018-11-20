User.create!(name:  "SimBed",
             email: "dansimbed@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
             
User.create!(name:  "Fluke",
             email: "example-4@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

0.upto(2) do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

4.upto(98) do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end


user = User.find(2)
package = user.packages.create!(name: "Aerial", instructor: "Lara", purchased_on: "2018-10-13", classes: 10, validity_type: "months" , validity_period: 1)
5.times do
  package.attendances.create!(date:Faker::Date.forward(60))
end

user = User.find(3)
package = user.packages.create!(name: "Partner Yoga", instructor: "Gigi", purchased_on: "2018-10-14", classes: 8, validity_type: "weeks" , validity_period: 8)
2.times do
  package.attendances.create!(date:Faker::Date.forward(60))
end
package = user.packages.create!(name: "BodyQuest", instructor: "Priti", purchased_on: "2018-10-13", classes: 32, validity_type: "months" , validity_period: 3)
30.times do
  package.attendances.create!(date:Faker::Date.forward(60))
end



