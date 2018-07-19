# integration test

require 'rails_helper'

describe 'navigate' do

  # make sure user is signed in
  before do
    user = User.create(email:"test@test.com", password:"asdfasdf", first_name:"josh", last_name:"snow")
    login_as(user, :scope => :user)
  end

  # can see all teams
  describe 'index' do
    it 'can be reached successfully' do
      visit teams_path
      expect(page.status_code).to eq(200)
    end
    it 'has a title of Teams' do
      visit teams_path
      expect(page).to have_content(/Teams/)
    end
  end
end
