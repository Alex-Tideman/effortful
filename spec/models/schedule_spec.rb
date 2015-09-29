require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it 'schedule has a start date with 1 Week Length' do
    user1 = User.create(name: "Alex Tideman",
                        first_name: "Alex",
                        last_name: "Tideman",
                        email: "alex.tideman@gmail.com",
                        image: "default.png")
    effort1 = Effort.create(title: "Sing songs", description: "Singing in the rain", length: "1 Week",
                            requested_reward: "Food", member_id: user1.id)


    effort1.schedule = Schedule.new
    schedule = effort1.schedule

    expect(schedule.start_date).to eq(schedule.created_at.strftime('%a, %d %b %Y'))
    expect(schedule.inactive).to eq(nil)
    expect(schedule.vote_period).to eq(nil)
    expect(schedule.end_date).to eq(schedule.created_at + 7.days)
    expect(schedule.time_remaining).to eq(168)
    expect(schedule.donate_week).to eq([schedule.end_date + 1.days,schedule.end_date + 2.days,
                                        schedule.end_date + 3.days,schedule.end_date + 4.days,
                                        schedule.end_date + 5.days,schedule.end_date + 6.days,
                                        schedule.end_date + 7.days])

  end

  it 'schedule has a start date and 1 Day Length' do
    user1 = User.create(name: "Alex Tideman",
                        first_name: "Alex",
                        last_name: "Tideman",
                        email: "alex.tideman@gmail.com",
                        image: "default.png")
    effort1 = Effort.create(title: "Sing songs", description: "Singing in the rain", length: "1 Day",
                            requested_reward: "Food", member_id: user1.id)


    effort1.schedule = Schedule.new
    schedule = effort1.schedule

    expect(schedule.start_date).to eq(schedule.created_at.strftime('%a, %d %b %Y'))
    expect(schedule.end_date).to eq(schedule.created_at + 1.days)

  end


  it 'schedule has a donate schedule with 1 Week Length' do
    user1 = User.create(name: "Alex Tideman",
                        first_name: "Alex",
                        last_name: "Tideman",
                        email: "alex.tideman@gmail.com",
                        image: "default.png")
    effort1 = Effort.create(title: "Sing songs", description: "Singing in the rain", length: "1 Week",
                            requested_reward: "Food", member_id: user1.id)

    effort1.schedule = Schedule.new
    schedule = effort1.schedule

    get_sponsors

    @user2.efforts << effort1
    @user3.efforts << effort1
    @user4.efforts << effort1
    @user5.efforts << effort1
    @user6.efforts << effort1
    @user7.efforts << effort1
    @user8.efforts << effort1

    expect(schedule.donate_schedule.count).to eq(7)
    expect(schedule.random_sponsor.class.to_s).to eq("User")

  end

  it 'schedule has a donate schedule with 1 Day Length' do
    user1 = User.create(name: "Alex Tideman",
                        first_name: "Alex",
                        last_name: "Tideman",
                        email: "alex.tideman@gmail.com",
                        image: "default.png")
    effort1 = Effort.create(title: "Sing songs", description: "Singing in the rain", length: "1 Day",
                            requested_reward: "Food", member_id: user1.id)

    effort1.schedule = Schedule.new
    schedule = effort1.schedule

    get_sponsors

    @user2.efforts << effort1
    @user3.efforts << effort1
    @user4.efforts << effort1
    @user5.efforts << effort1
    @user6.efforts << effort1
    @user7.efforts << effort1
    @user8.efforts << effort1

    expect(schedule.donate_schedule.count).to eq(1)

  end

end
