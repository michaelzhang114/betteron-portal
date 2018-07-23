# integration test

require 'rails_helper'

describe 'navigate' do

  # make sure user is signed in
  before do
    @team = FactoryGirl.create(:team)
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
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

  # mimic signing in a user, create a team
  describe 'creation' do
    it 'has a new form that can be reached' do
      visit new_team_path
      expect(page.status_code).to eq(200)
    end
    it 'can be created from new form page' do
      visit new_team_path
      fill_in 'team[name]', with: "Some team"
      click_on "Save"
      expect(page).to have_content("Some team")
    end
  end


end
