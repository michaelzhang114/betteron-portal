# integration test

require 'rails_helper'

describe 'navigate' do

  # make sure user is signed in
  before do
    @team = Team.create(name: "blah")
    @user = User.create(email:"test@test.com", password:"asdfasdf", first_name:"josh", last_name:"snow", team: Team.last)
    login_as(@user, :scope => :user)
  end

  # can see all posts
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
    it 'has a list of posts' do
      post1 = Post.create(date: Date.today, rationale: "post1")
      post2 = Post.create(date: Date.today, rationale: "post2")
      visit posts_path
      expect(page).to have_content(/post1|post2/)
    end
  end

  # mimic signing in a user, create a post, check to see if user is associated with that post
  describe 'creation' do
    before do
      visit new_post_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end
    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"
      expect(page).to have_content("Some rationale")
    end
    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
end
