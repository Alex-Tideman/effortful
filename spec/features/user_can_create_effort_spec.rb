require './spec/rails_helper'

RSpec.describe "User can create effort", type: :feature do

  it 'user can view create effort page' do
    VCR.use_cassette('user_can_create_effort_test#view_effort') do
      visit root_path

      get_user
      click_link_or_button 'Login'

      expect(current_path).to eq root_path
      click_link_or_button 'Profile'

      expect(current_path).to eq user_profile_path

      expect(page).to have_content("Alex Tideman")
      expect(page).to have_content("Member")
      expect(page).to have_content("My Efforts")
      expect(page).to have_content("My Mission")

      expect(page).to have_content("Create")
      click_link_or_button 'Create'

      expect(current_path).to eq new_user_effort


      expect(page).to have_content("Set Location")
      expect(page).to have_content("Submit")
    end
  end

end