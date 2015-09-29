require './spec/rails_helper'

RSpec.describe "User can view all efforts after logging in", type: :feature do


  it 'user can view efforts index' do
    VCR.use_cassette('user_can_view_efforts#view') do

      user1 = User.create(name: "Alex Tideman",
                      first_name: "Bob",
                      last_name: "Jones",
                      email: "alex.tideman@gmail.com",
                      image: "default.png")
      effort1 = Effort.create(title: "Sing songs", description: "Singing in the rain", length: "1 Week",
                    requested_reward: "Food", member_id: user1.id)
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

      visit efforts_path

      click_link_or_button 'Sing songs'

      expect(current_path).to eq user_effort_path(id: effort1.id, user: user1.id)

      expect(page).to have_content("Singing in the rain")
      expect(page).to have_content("Start Date: TBD")
      expect(page).to have_content("Time Remaining: TBD")
      
    end
  end



end