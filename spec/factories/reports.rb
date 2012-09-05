# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    start_date "2012-09-05"
    end_date "2012-09-05"
    title "MyString"
    content "MyText"
  end
end
