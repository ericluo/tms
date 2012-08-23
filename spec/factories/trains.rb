# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :train do
    name "MyString"
    trainee_id 1
    start_date "2012-08-23"
    end_date "2012-08-23"
    type ""
    score 1.5
    certificate "MyString"
    comment "MyText"
    registrar_id 1
    period 1.5
    organizer "MyString"
  end
end
