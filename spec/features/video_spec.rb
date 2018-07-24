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
    # it 'has title of videos' do
    #   expect(page).to have_content(/video/)
    # end
    # it 'has a list of videos' do
    #   video1 = FactoryGirl.create(:video)
    #   video2 = FactoryGirl.create(:second_video)
    #   visit post_videos_path(post_id: @post)
    #   expect(page).to have_content(/pJif4i9NRdI|piW99z4KsZk/)
    # end
  end


end
