FactoryGirl.define do

  # can't have duplicate emails
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    first_name "Jon"
    last_name "Snow"
    email { generate :email }
    password "asdfasdf"
    team
  end

  factory :admin_user, class: "AdminUser" do
    first_name "Admin"
    last_name "User"
    email { generate :email }
    password "asdfasdf"
    team
  end
end
