require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "creation" do
    before do
      @team = Team.create(name: "new team")
    end

    it "can be created" do
      expect(@team).to be_valid
    end

    it "cannot be created without a name" do
      @team.name = nil
      expect(@team).to_not be_valid
    end
  end
end
