# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    title "Antique vase"
    description "Antique-look porcelain vase with mottled 
        copper finish, rose design. Footed metal base. 11inch diameter x 15inch high."
    start_bid 125
    event_id 1
  end
end