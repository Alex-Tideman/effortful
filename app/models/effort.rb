class Effort < ActiveRecord::Base
  attr_reader :effort_time, :day
  has_many :user_efforts
  has_many :users, through: :user_efforts
  has_one :vote

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

  def active_time
    Time.now if sponsors.count == 7 && volunteer
  end

  def past
    if active
      true if Time.now > end_date
    end
  end

  def start_date
    if active
      active_time.strftime('%a, %d %b %Y')
    else
      "TBD"
    end
  end

  def vote_time
    if active
      end_date - 12.hours
    end
  end

  def vote_remaining
    if active
    "#{((end_date - (end_date - 12.hours)) / 3600).round} hours"
    end
  end

  def end_date
    if active
      if length == "1 Week"
        active_time + 7.days
      elsif length == "1 Day"
        active_time + 1.days
      end
    end
  end

  def time_remaining
    if start_date == "TBD"
      "Effort has yet to begin."
    else
      "#{((end_date - Time.now) / 3600).round} hours"
    end
  end

  def day
    if active
      [end_date + 1.days, end_date + 2.days, end_date + 3.days,end_date + 4.days,end_date + 5.days,end_date + 6.days,end_date + 7.days].shuffle.pop
    end
  end

  def result
    if yes_vote >= no_vote
      "Success"
    else
      "Next time"
    end
  end

end
