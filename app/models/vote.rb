class Vote < ActiveRecord::Base
  has_many :users
  belongs_to :effort

  def result
    if yes >= no
      "Success"
    else
      "Next time"
    end
  end
end
