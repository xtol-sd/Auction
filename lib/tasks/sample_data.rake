namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    require 'faker'

    puts 'Generating generic bidder and seller'
    User.create!(name: "bidder",
                 email: "bidder@sample.com",
                 password: "password",
                 password_confirmation: "password",
                 address: "1600 Amphitheatre Parkway",
                 city: "Mountain View",
                 state: "CA",
                 zip: "94043",
                 phone: "650-253-0000")

    User.create!(name: "seller",
                 email: "seller@sample.com",
                 password: "password",
                 password_confirmation: "password",
                 address: "701 First Avenue",
                 city: "Sunnyvale",
                 state: "CA",
                 zip: "94089",
                 phone: "408-349-3300")

    #Sample Users
    puts "Generating Sample Users"
    20.times do
      User.create!(name: Faker::Name.name,
                   email: Faker::Internet.email,
                   password: "password",
                   password_confirmation: "password",
                   address: Faker::Address.street_address,
                   city: Faker::Address.city,
                   state: Faker::Address.state_abbr,
                   phone: Faker::PhoneNumber.phone_number)
    end

    #Item Descriptions
    puts "Generating Item Descriptions"
    20.times do |n|
      Item.create!(
        user_id: n+1,
        title: Faker::Lorem.words(2).join(" ").to_s.capitalize,
        description: Faker::Lorem.sentences(2).join(" "),
        start_bid: rand(1..90)
      )
    end
  end
end