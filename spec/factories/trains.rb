# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :train do
    start_date "2012-08-21"
    end_date "2012-08-21"
    duration 1.5
    organizer "MyString"
    category_id 1
    user_id 1
  end
end
