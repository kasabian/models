# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :costomer do
    sequence(:name) {|n| "Vasya#{n}"}
    age 23
   
  end
end


