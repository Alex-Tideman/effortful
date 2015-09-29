require './spec/rails_helper'

RSpec.describe "User can view all efforts after logging in", type: :feature do

  it 'user can view efforts index' do
    VCR.use_cassette('user_can_view_efforts#view') do

      user1 = User.create(name: "Bob Jones",
                          first_name: "Bob",
                          last_name: "Jones",
                          email: "bj@gmail.com",
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

      select "Sponsor", :from => "user[role]"

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

  it 'volunteer can vote on effort to start schedule' do
    VCR.use_cassette('volunteer_can_vote_to_start_schedule#effort') do

      user1 = User.create(name: "Bob Jones",
                          first_name: "Bob",
                          last_name: "Jones",
                          email: "bj@gmail.com",
                          image: "default.png")
      effort1 = Effort.create(title: "Sing songs", description: "Singing in the rain", length: "1 Week",
                              requested_reward: "Food", member_id: user1.id)

      effort1.vote = Vote.new

      get_sponsors

      @user2.efforts << effort1
      @user3.efforts << effort1
      @user4.efforts << effort1
      @user5.efforts << effort1
      @user6.efforts << effort1
      @user7.efforts << effort1
      @user8.efforts << effort1

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

      expect(page).to have_content("Time Remaining: TBD")

      click_link_or_button 'Add Volunteer'

      expect(page).to have_content("Time Remaining: 168 hours")

      expect(effort1.sponsors.count).to eq(7)



    end
  end

  it 'sponsor can vote on effort to start schedule' do
    VCR.use_cassette('sponsor_can_vote_to_start_schedule#effort') do

      user1 = User.create(name: "Bob Jones",
                      first_name: "Bob",
                      last_name: "Jones",
                      email: "bj@gmail.com",
                      image: "default.png")
      effort1 = Effort.create(title: "Sing songs", description: "Singing in the rain", length: "1 Week",
                    requested_reward: "Food", member_id: user1.id)

      effort1.vote = Vote.new

      get_sponsors

      @user2.efforts << effort1
      @user3.efforts << effort1
      @user4.efforts << effort1
      @user5.efforts << effort1
      @user6.efforts << effort1
      @user7.efforts << effort1
      @user9.efforts << effort1
      effort1.volunteer_id = @user9.id

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

      select "Sponsor", :from => "user[role]"

      click_link_or_button 'SUBMIT'

      expect(current_path).to eq profile_path

      expect(page).to have_content("Alex Tideman")
      expect(page).to have_content("Volunteer")
      expect(page).to have_content("Sponsor")
      expect(page).to have_content("Help people")

      visit efforts_path

      click_link_or_button 'Sing songs'

      expect(current_path).to eq user_effort_path(id: effort1.id, user: user1.id)

      expect(page).to have_content("Time Remaining: TBD")

      click_link_or_button 'Add Sponsor'

      expect(effort1.sponsors.count).to eq(7)


    end
  end

  it 'sponsor can vote on effort' do
    VCR.use_cassette('sponsor_can_vote#effort') do

      user1 = User.create(name: "Bob Jones",
                          first_name: "Bob",
                          last_name: "Jones",
                          email: "bj@gmail.com",
                          image: "default.png")
      effort1 = Effort.create(title: "Sing songs", description: "Singing in the rain", length: "1 Week",
                              requested_reward: "Food", member_id: user1.id)

      effort1.vote = Vote.new

      get_sponsors

      @user2.efforts << effort1
      @user3.efforts << effort1
      @user4.efforts << effort1
      @user5.efforts << effort1

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

      select "Sponsor", :from => "user[role]"

      click_link_or_button 'SUBMIT'

      expect(current_path).to eq profile_path

      expect(page).to have_content("Alex Tideman")
      expect(page).to have_content("Sponsor")
      expect(page).to have_content("Cycling")
      expect(page).to have_content("Help people")

      visit efforts_path

      click_link_or_button 'Sing songs'

      expect(current_path).to eq user_effort_path(id: effort1.id, user: user1.id)

      expect(page).to have_content("TBD")


      click_link_or_button 'Add Sponsor'

      expect(page).to have_content("Time Remaining: TBD")


    end
  end

  it 'volunteer can vote on effort' do
    VCR.use_cassette('volunteer_can_vote#effort') do

      user1 = User.create(name: "Bob Jones",
                          first_name: "Bob",
                          last_name: "Jones",
                          email: "bj@gmail.com",
                          image: "default.png")
      effort1 = Effort.create(title: "Sing songs", description: "Singing in the rain", length: "1 Week",
                              requested_reward: "Food", member_id: user1.id)

      effort1.vote = Vote.new

      get_sponsors

      @user2.efforts << effort1
      @user3.efforts << effort1
      @user4.efforts << effort1
      @user5.efforts << effort1

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

      expect(page).to have_content("TBD")


      click_link_or_button 'Add Volunteer'

      expect(page).to have_content("Time Remaining: TBD")



    end
  end



end