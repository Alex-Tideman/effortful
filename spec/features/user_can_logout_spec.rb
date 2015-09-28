require './spec/rails_helper'

RSpec.describe "User can logout after logging in", type: :feature do

  it 'user can view profile and logout' do
    VCR.use_cassette('user_can_logout_test#logout') do
      visit root_path
      get_user

      click_link_or_button 'Login'

      expect(current_path).to eq root_path
      click_link_or_button 'Profile'

      expect(current_path).to eq user_profile_path

      expect(page).to have_content("Alex Tideman")
      expect(page).to have_content("My Efforts")
      expect(page).to have_content("My Mission")

      expect(page).to have_content("Logout")
      click_link_or_button 'Logout'

      expect(current_path).to eq root_path

      expect(page).to have_no_content("Logout")

    end
  end

end