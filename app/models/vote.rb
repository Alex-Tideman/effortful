class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :effort

  def result
    if yes >= no
      "Success"
    else
      "Next time"
    end
  end
end
