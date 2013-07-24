# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Bidder'
    email 'bidder@example.com'
    password 'password'
    password_confirmation 'password'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now

  factory :admin do
    after(:create) {|user| user.add_role(:admin)}
  end

  end

end
