require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      @team = Team.create(name: "blah")
      @user = User.create(email:"test@test.com", password:"asdfasdf", first_name:"josh", last_name:"snow", team: Team.last)
      #login_as(@user, :scope => :user)
      @post = Post.create(date: Date.today, rationale: "anything", user_id: @user.id)
    end

    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without a date and rationale' do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end


  end
end
