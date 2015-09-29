require './spec/rails_helper'

RSpec.describe "User can login and logout after logging in", type: :feature do


  it 'user can view profile and edit profile' do
    VCR.use_cassette('user_can_edit_profile_test#edit') do
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

      click_link_or_button 'Edit'

      expect(current_path).to eq profile_edit_path

      expect(page).to have_content("Select Your Role")
      expect(page).to have_content("What are your hobbies")

      fill_in 'What are your hobbies?', :with => 'Cycling'
      fill_in 'What is your mission for Effortful?', :with => 'Help people'
      fill_in 'user[location]', :with => 'adults.link.income'

      select "Volunteer", :from => "user[role]"

      click_link_or_button 'SUBMIT'

      expect(current_path).to eq profile_path

      expect(page).to have_content("Alex Tideman")
      expect(page).to have_content("Volunteer")
      expect(page).to have_content("Cycling")
      expect(page).to have_content("Help people")

    end
  end

  it 'user can view profile and logout' do
    VCR.use_cassette('user_can_logout_test#logout') do
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


      expect(page).to have_content("Logout")
      click_link_or_button 'Logout'

      expect(current_path).to eq root_path

      expect(page).to have_no_content("Logout")

    end
  end

end