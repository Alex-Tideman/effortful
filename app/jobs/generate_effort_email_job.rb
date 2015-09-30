class GenerateEffortEmailJob < ActiveJob::Base
  queue_as :default

  def perform(effort)
    EffortMailer.send_schedule_over_email(effort).deliver_now
  end
end
