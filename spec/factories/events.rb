# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "Event Name"
    start_datetime "2013-07-02 23:16:47"
    end_datetime "2013-09-02 23:16:47"
    current true
  end
end
