FactoryGirl.define do
  factory :video do
    heading "first video"
    link "https://www.youtube.com/watch?v=pJif4i9NRdI"
    post
  end
  factory :second_video, class: "Video" do
    heading "second video"
    link "https://www.youtube.com/watch?v=piW99z4KsZk"
    post
  end
end
