FactoryGirl.define do


  # can't have duplicate team names
  sequence :name do |n|
    "team#{n}"
  end


  # come back to make more users in same team


  factory :team do
    name { generate :name }
  end
end
