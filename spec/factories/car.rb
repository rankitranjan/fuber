require 'factory_girl'

FactoryGirl.define do

  factory :car do
    color  "Silver"
    availability true
    latitude 400
    longitude 40
    number "MP09AB1231"
    owner_name "foo"
    model "Xcent"
  end
end
