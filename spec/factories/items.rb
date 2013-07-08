# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    user_id 1
    title "MyString"
    description "MyString"
    start_bid 1
  end
end
