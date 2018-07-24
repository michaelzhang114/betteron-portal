# integration test

require 'rails_helper'

describe 'navigate' do

  # make sure user is signed in
  before do
    @team = FactoryGirl.create(:team)
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    @post = FactoryGirl.create(:post)
  end

  # can see index page
  describe 'nested route index' do
    before do
      visit post_videos_path(post_id: @post)
    end
    it 'has index page nested under post' do
      expect(page.status_code).to eq(200)
    end
    it 'has title of videos' do
      expect(page).to have_content(/Videos/)
    end
    it 'does not show videos created by other users' do
      video1 = FactoryGirl.create(:video)
      video2 = FactoryGirl.create(:second_video)
      visit post_videos_path(post_id: @post)
      expect(page).to have_no_content(/pJif4i9NRdI|piW99z4KsZk/)
    end
    it 'shows videos created by current user' do
      @index_user = User.create(email:"test@test.com", password: "asdfasdf", first_name: "joe", last_name: "bloggs", team_id: @team.id)
      logout(:user)
      login_as(@index_user, :scope => :user)
      post = Post.create(date: Date.today, rationale: "xyz", user_id: @index_user.id)
      video3 = Video.create(heading: "abcd", link: "https://www.youtube.com/watch?v=W1_D1Snja0E", post_id: post.id)
      visit post_videos_path(post_id: post)
      expect(page).to have_content(/abcd/)
    end
  end


end
