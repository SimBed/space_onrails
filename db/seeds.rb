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

date_array = Array.new (50) {|e| Faker::Date.forward(23)}
user = User.find(2)
user.packages.create!(name: "Aerial", instructor: "Lara", purchased_on: "2018-10-13", classes: 10, classes_taken:["1 Sep","15 Sep","19 Sep", "3 Oct"])
user = User.find(3)
user.packages.create!(name: "BodyQuest", instructor: "Priti", purchased_on: "2018-10-13", classes: 5,  classes_taken:["1 Dec","5 Dec","12 Dec", "13 Dec", "14 Dec"])
user.packages.create!(name: "Partner Yoga", instructor: "Gigi", purchased_on: "2018-10-14", classes: 2, classes_taken:date_array)
#user.packages.create!(name: "Partner Yoga", instructor: "Gigi", purchased_on: "2018-10-14", classes: 2, classes_taken:"1 Dec")


