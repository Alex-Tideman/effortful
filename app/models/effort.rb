class Effort < ActiveRecord::Base
  # include CacheInvalidator

  has_many :user_efforts
  has_many :users, through: :user_efforts
  has_one :schedule
  has_one :vote

  validates :title, :description, :requested_reward, :length, presence: true

  def member
    User.find(member_id)
  end

  def volunteer
    User.find(volunteer_id) if volunteer_id
  end

  def sponsors
    users.map do |user|
      user if user.role == "Sponsor"
    end.compact
  end

  def result
    if vote.yes >= vote.no
      "Success"
    else
      "Next time"
    end
  end


end
