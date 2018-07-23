require 'rails_helper'

RSpec.describe User, type: :model do
  before do
      @team = FactoryGirl.create(:team)
      @user = FactoryGirl.create(:user)
    end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
    it "cannot be created without first_name, last_name, team" do
      @user.first_name = nil
      @user.last_name = nil
      @user.team = nil
      expect(@user).to_not be_valid
    end
  end


  describe "custom name methods" do
    it "has a full name method" do
      expect(@user.full_name).to eq("SNOW, JON")
    end
  end

end
