require 'rails_helper'

RSpec.describe Vote, type: :model do
  it 'vote has yes and no count with Success' do
    user1 = User.create(name: "Alex Tideman",
                        first_name: "Alex",
                        last_name: "Tideman",
                        email: "alex.tideman@gmail.com",
                        image: "default.png")
    effort1 = Effort.create(title: "Sing songs", description: "Singing in the rain", length: "1 Week",
                            requested_reward: "Food", member_id: user1.id)

    effort1.vote = Vote.new(yes: 3, no: 2)
    vote = effort1.vote


    expect(vote.yes).to eq(3)
    expect(vote.no).to eq(2)
    expect(vote.result).to eq("Success")

  end

  it 'vote has yes and no count with Next Time' do
    user1 = User.create(name: "Alex Tideman",
                        first_name: "Alex",
                        last_name: "Tideman",
                        email: "alex.tideman@gmail.com",
                        image: "default.png")
    effort1 = Effort.create(title: "Sing songs", description: "Singing in the rain", length: "1 Week",
                            requested_reward: "Food", member_id: user1.id)

    effort1.vote = Vote.new(yes: 3, no: 4)
    vote = effort1.vote


    expect(vote.yes).to eq(3)
    expect(vote.no).to eq(4)
    expect(vote.result).to eq("Next time")

  end

end
