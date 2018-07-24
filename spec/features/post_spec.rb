# integration test

require 'rails_helper'

describe 'navigate' do

  # make sure user is signed in
  before do
    @team = FactoryGirl.create(:team)
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  # can see all posts
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
    it 'has a title of lesson' do
      visit posts_path
      expect(page).to have_content(/Lessons/)
    end
    it 'cannot see posts created by different user' do
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      visit posts_path
      expect(page).to have_no_content(/rationale|content/)
    end
    it 'can see posts created by current user' do
      @index_user = User.create(email:"test@test.com", password: "asdfasdf", first_name: "joe", last_name: "bloggs", team_id: @team.id)
      logout(:user)
      login_as(@index_user, :scope => :user)
      post3 = Post.create(date: Date.today, rationale: "alalala", user_id: @index_user.id)
      visit posts_path
      expect(page).to have_content(/alalala/)
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

  # editing a post
  describe 'edit' do
    before do
      @team = FactoryGirl.create(:team)
      @edit_user = User.create(email:"test@test.com", password: "asdfasdf", first_name: "joe", last_name: "bloggs", team_id: @team.id)
      logout(:user)
      login_as(@edit_user, :scope => :user)
      @edit_post = Post.create(date: Date.today, rationale: "blah", user_id: @edit_user.id)
    end
    it 'can be reached by clicking edit on index page' do
      visit posts_path
      click_link("edit_#{@edit_post.id}") #looking for id instead of text 'edit'
      expect(page.status_code).to eq(200)
    end
    it 'can be edited' do
      visit edit_post_path(@edit_post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "edited content"
      click_on "Save"
      expect(page).to have_content("edited content")
    end
  end

end
