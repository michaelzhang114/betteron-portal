FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "some rationale"
    user
  end
  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "some more content"
    user
  end
end
