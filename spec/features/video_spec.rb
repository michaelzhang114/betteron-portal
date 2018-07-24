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

  describe 'nested route' do
    it 'has index page nested under post' do
      visit post_videos_path(post_id: @post)
      expect(page.status_code).to eq(200)
    end
  end


end
