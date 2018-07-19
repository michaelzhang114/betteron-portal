require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @team = Team.create(name: "blah")
      @user = User.create(email: "test@test.com", password: "asdfasdf", first_name: "john", last_name: "snow", team: Team.last)
    end

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
end
