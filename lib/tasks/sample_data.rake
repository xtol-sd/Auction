namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    require 'faker'

    # puts 'SPONSER, BIDDER, SELLER'
    
    User.create!(name: "sponsor",
                 email: "sponsor@example.com",
                 password: "password",
                 password_confirmation: "password",
                 address: "1600 Sponsor Way",
                 city: "Mountain View",
                 state: "CA",
                 zip: "94043",
                 phone: "808-4429-8785")


    User.create!(name: "bidder",
                 email: "bidder@example.com",
                 password: "password",
                 password_confirmation: "password",
                 address: "1600 Amphitheatre Parkway",
                 city: "Mountain View",
                 state: "CA",
                 zip: "94043",
                 phone: "650-253-0000")

    User.create!(name: "seller",
                 email: "seller@example.com",
                 password: "password",
                 password_confirmation: "password",
                 address: "701 First Avenue",
                 city: "Sunnyvale",
                 state: "CA",
                 zip: "94089",
                 phone: "408-349-3300")

    #Sample Users
    puts "SAMPLE USERS"
    20.times do
      User.create!(name: Faker::Name.name,
                   email: Faker::Internet.email,
                   password: "password",
                   password_confirmation: "password",
                   address: Faker::Address.street_address,
                   city: Faker::Address.city,
                   state: Faker::Address.state_abbr,
                   phone: Faker::PhoneNumber.phone_number,
                   zip: "94043")
    end

    #Item Descriptions
    puts "SAMPLE ITEMS"
   
    item = Item.create!(
      title: "Antique vase",
      description: "Antique-look porcelain vase with mottled 
        copper finish, rose design. Footed metal base. 11inch diameter x 15inch high.",
      start_bid: 125,
      event_id: "1"
    )
    pi = Photo.create!(:item_id => item.id )
    pi.image.store!(File.open(File.join(Rails.root, 'app/assets/images/antique_vase.jpg')))
    item.photos << pi
    item.save!

    item = Item.create!(
      title: "Ship in a Bottle",
      description: "'Newsboy' ship in bottle model, 200 ml 'hip flask' bottle.  Finely crafted, 
      highly detailed miniature ship models. Built by magazine article author and award winning 
      model ship builder John Fox III.

      John has 27 years of experience at professional model ship building, has had his models 
      displayed in numerous museums and spoken at symposiums about his unique style of ship modeling. 
      John has won over 30 awards at national and internationl model ship and boat building competitions, 
      and has authored over 17 published magazine articles about his work.",
      start_bid: 200,
      event_id: "1"
    )
    pi = Photo.create!(:item_id => item.id )
    pi.image.store!(File.open(File.join(Rails.root, 'app/assets/images/ship_in_bottle.jpg')))
    item.photos << pi
    item.save!

    item = Item.create!(
      title: "Harry Potter Hardcover Boxed Set in Treasure Box",
      description: "Collectible hardcover editions of all seven books in J.K. Rowlings phenomenal 
      bestselling saga are snugly packed in a decorative, trunk-like box with sturdy handles and 
      a privacy lock, accompanied by decorative stickers. 

      This set is brand new and in perfect condition with no missing or damaged pages.",
      start_bid: 75,
      event_id: "1"
    )
    pi = Photo.create!(:item_id => item.id )
    pi.image.store!(File.open(File.join(Rails.root, 'app/assets/images/harry_potter_book_set.jpg')))
    item.photos << pi
    item.save!


    item = Item.create!(
      title: "Raiders Season Tickets",
      description: "2013 Season Tickets to the Oakland Raiders.",
      start_bid: 100,
      event_id: "1"
    )
    pi = Photo.create!(:item_id => item.id )
    pi.image.store!(File.open(File.join(Rails.root, 'app/assets/images/raiders_season_tickets.jpeg')))
    item.photos << pi
    item.save!

    item = Item.create!(
      title: "Gourmet BBQ Gift Basket",
      description: "The Barbeque Gourmet Gift Basket is the perfect gift for anyone that loves to grill, 
      adding new flavors to their favorite dishes. Arriving in an attractive metal basket, this gourmet gift 
      includes: Urban Accents Grilling Rub, Urban Accents Dry Glaze, Guy Fieri BBQ Sauce, Jack Daniels Whiskey 
      Praline Pecans, Rub with Love Chicken Rub, Rub with Love Smokey BBQ Rub, Bilardo Bros. Meat Rub, 
      wild margarita meat and seafood seasoning, and metal tongs.", 
      start_bid: 100,
      event_id: "1"
    )
    pi = Photo.create!(:item_id => item.id )
    pi.image.store!(File.open(File.join(Rails.root, 'app/assets/images/bbq_gift_basket.jpg')))
    item.photos << pi
    item.save!


    item = Item.create!(
      title: "Gourmet Cheese Gift Basket",
      description: "Includes: Gift Boxed Wooden Handle Cheese Spreader, White Zinfandel Havarti Wine Cheese Cup,
        Swiss Blend Cheese Triangle, Old Hickory Cheese Triangle, Pepper Flavor Cheese Bar,
        Garden Vegetable Cheese Spread, Sonoma Monterey Jack Cheese Spread in Wooden Hoop, 
        Zesty Cheddar Flavored Cheese Spread, Trenton Original Wine Crackers, Venus Fancy Water Crackers
        Summer Beef Sausage, Gourmet California Smoked Almonds, J & M Original Cheese Straws, 
        Los Olivos Wine & Cheese Biscuits, ...in an Oval Dark Stained Gift Basket with Wooden Handles.", 
      start_bid: 100,
      event_id: "1"
    )
    pi = Photo.create!(:item_id => item.id )
    pi.image.store!(File.open(File.join(Rails.root, 'app/assets/images/cheese_gift_basket.jpg')))
    item.photos << pi
    item.save!
  
    puts 'FIRST EVENT'
    Event.create!(
      :current => true,
      :end_datetime => DateTime.now + 1.month,
      :name => "Auction 2013"
    )

    puts 'APPROVE ITEMS'
    (1..5).each do |s|
      Donation.create!(
        :status => "1",
        :user_id => "3", #seller user id
        :item_id => s,
        :hidden => 0
      )
    end

  end
end