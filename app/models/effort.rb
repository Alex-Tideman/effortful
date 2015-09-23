class Effort < ActiveRecord::Base
  attr_reader :start_date, :end_date, :time_remaining
  has_many :user_efforts
  has_many :users, through: :user_efforts

  validates :title, :description, :requested_reward, :length, presence: true

  def member
    User.find(member_id)
  end

  def volunteer
    User.find(volunteer_id) if !volunteer_id.nil?
  end

  def sponsors
    users.map do |user|
      user if user.role == "Sponsor"
    end.compact
  end

  def active
    true if sponsors.count == 7 && volunteer
  end

  def past
    true if Time.now > end_date
  end

  def start_date
    if active
      updated_at.strftime('%a, %d %b %Y')
    else
      "TBD"
    end
  end

  def end_date
    if length == "1 Week"
      start_date + 7.days
    elsif length == "1 Day"
      start_date + 1.days
    end
  end

  def time_remaining
    if start_date == "TBD"
      "Effort has yet to begin."
    else
      end_date - Time.now.strftime('%a, %d %b %Y')
    end
  end

end
