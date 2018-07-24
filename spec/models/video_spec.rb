require 'rails_helper'

RSpec.describe Video, type: :model do
  describe "creation" do
    before do
      @team = FactoryGirl.create(:team)
      @user = FactoryGirl.create(:user)
      #login_as(@user, :scope => :user)
      @post = FactoryGirl.create(:post)
      @video = FactoryGirl.create(:video)
    end

    it 'can be created' do
      expect(@video).to be_valid
    end

    it 'cannot be created without a heading and link' do
      @video.heading = nil
      @video.link = nil
      expect(@video).to_not be_valid
    end
  end
end
