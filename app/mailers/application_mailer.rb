class ApplicationMailer < ActionMailer::Base
  default from: "thankyou@effortful.com"
  layout 'mailer'

  helper_method :what3words

  def what3words
    What3Words::API.new(:key => ENV["what3words_api_key"])
  end

end
