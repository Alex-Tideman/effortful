class EffortMailer < ApplicationMailer

  def send_schedule_over_email(effort)
    @effort = effort
    mail(
        to: @effort.volunteer.email,
        subject: "You have a new Effort delivery tomorrow!",
    )
  end

end
