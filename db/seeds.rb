User.create!(name:  "SimBed",
             email: "dansimbed@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
             
User.create!(name:  "Fluke",
             email: "example-4@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false)

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