class Schedule < ActiveRecord::Base
  belongs_to :effort

  # attr_reader :start_time, :start_date, :vote_time, :vote_remaining,
  #             :end_date, :time_remaining, :donate_week, :inactive,
  #             :donate_schedule, :random_sponsor, :vote_result

  def inactive
    true if Time.now > end_date
  end

  def start_date
    created_at.strftime('%a, %d %b %Y')
  end

  def vote_time
    effort.end_date - 12.hours
  end

  def end_date
    if effort.length == "1 Week"
      created_at + 7.days
    elsif effort.length == "1 Day"
      created_at + 1.days
    end
  end

  def time_remaining
    ((end_date - Time.now) / 3600).round
  end

  def donate_week
    [end_date + 1.days, end_date + 2.days, end_date + 3.days,end_date + 4.days,end_date + 5.days,end_date + 6.days,end_date + 7.days]
  end

  def donate_schedule
    week = donate_week
    sponsors = effort.sponsors.shuffle

    week.map do |day|
      [day,sponsors.pop]
    end
  end

  def random_sponsor
    effort.sponsors.shuffle.pop
  end


end
