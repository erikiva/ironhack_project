require 'faker'

FactoryGirl.define do
  factory :event do
    name "MyString"
    user nil
    event_date Faker::Date.forward(20)
  end

end
