class Schedulizer
  attr_reader :start_time, :start_date, :vote_time, :vote_remaining,
              :end_date, :time_remaining, :donate_week, :inactive,
              :donate_schedule, :random_sponsor, :vote_result

  def initialize(effort, time)
    @effort = effort
    @start_time = time
  end

  def inactive
    true if Time.now > end_date
  end

  def start_date
    @start.strftime('%a, %d %b %Y')
  end

  def vote_time
    @effort.end_date - 12.hours
  end

  def vote_remaining
    if active
      ((@effort.end_date - (@effort.end_date - 12.hours)) / 3600).round
    end
  end

  def end_date
      if @effort.length == "1 Week"
        @start_time + 7.days
      elsif @effort.length == "1 Day"
        @start_time + 1.days
      end
  end

  def time_remaining
      ((@effort.end_date - Time.now) / 3600).round
  end

  def donate_week
      [end_date + 1.days, end_date + 2.days, end_date + 3.days,end_date + 4.days,end_date + 5.days,end_date + 6.days,end_date + 7.days]
  end

  def donate_schedule
    week = donate_week
    sponsors = @effort.sponsors.shuffle

    week.map do |day|
      [day,sponsors.pop]
    end
  end

  def random_sponsor
    @effort.sponsors.shuffle.pop
  end

  def vote_result
    if @effort.yes_vote >= @effort.no_vote
      "Success"
    else
      "Next time"
    end
  end



end