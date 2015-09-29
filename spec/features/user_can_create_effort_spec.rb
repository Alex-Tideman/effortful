require './spec/rails_helper'

RSpec.describe "User can create effort", type: :feature do

  it 'user can view create effort page' do
    VCR.use_cassette('user_can_create_effort_test#create_effort') do
      visit root_path

      get_user
      click_link_or_button 'Login'

      expect(current_path).to eq root_path
      click_link_or_button 'Profile'

      expect(current_path).to eq profile_path

      expect(page).to have_content("Alex Tideman")
      expect(page).to have_content("My Hobbies")
      expect(page).to have_content("My Mission")
      expect(page).to have_content("My Sponsors")
      expect(page).to have_content("My Volunteers")

      click_link_or_button 'Create Effort'

      expect(current_path).to eq new_user_effort_path(@user)

      expect(page).to have_content("Set Location")
      expect(page).to have_content("Select Your Reward")

    end
  end


  it 'user can view create show page' do
    VCR.use_cassette('user_can_create_effort_test#show_effort') do
      visit root_path

      get_user
      click_link_or_button 'Login'

      expect(current_path).to eq root_path
      click_link_or_button 'Profile'

      expect(current_path).to eq profile_path

      expect(page).to have_content("Alex Tideman")
      expect(page).to have_content("My Hobbies")
      expect(page).to have_content("My Mission")
      expect(page).to have_content("My Sponsors")
      expect(page).to have_content("My Volunteers")

      click_link_or_button 'Create Effort'

      expect(current_path).to eq new_user_effort_path(@user)

      expect(page).to have_content("Set Location")
      expect(page).to have_content("Select Your Reward")

      fill_in 'Name Your Effort', :with => 'Pick up trash'
      fill_in 'What are you going to do?', :with => 'Get all the trash'

      select "1 Week", :from => "effort[length]"
      select "Food", :from => "effort[requested_reward]"

      click_link_or_button 'SUBMIT'

      expect(page).to have_content("Sponsors & Volunteer")
      expect(page).to have_content("Rewards")
      expect(page).to have_content("Length")

    end
  end

end