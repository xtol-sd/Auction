# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :donation do
    user_id 1
    item_id 1
    status 1
    comment ''
    status_created_at "2013-09-02 23:16:47"
  end
  
end
