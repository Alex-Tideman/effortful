require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user has a sponsor count' do
    user1 = User.create(name: "Alex Tideman",
                        first_name: "Alex",
                        last_name: "Tideman",
                        email: "alex.tideman@gmail.com",
                        image: "default.png")
    effort1 = Effort.create(title: "Sing songs", description: "Singing in the rain", length: "1 Week",
                            requested_reward: "Food", member_id: user1.id)

    get_sponsors

    user1.efforts << effort1
    @user2.efforts << effort1
    @user3.efforts << effort1
    @user4.efforts << effort1
    @user5.efforts << effort1
    @user6.efforts << effort1
    @user7.efforts << effort1
    @user8.efforts << effort1
    @user9.efforts << effort1
    effort1.volunteer_id = @user9.id


    expect(user1.sponsor_count.keys.count).to eq(7)
    expect(user1.volunteer_count.keys.count).to eq(1)
    expect(@user9.member_count.keys.count).to eq(1)
    expect(@user3.member_count.keys.count).to eq(1)
    expect(@user3.member_count.keys.first.name).to eq("Alex Tideman")





  end
end


