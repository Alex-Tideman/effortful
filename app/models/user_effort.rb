class UserEffort < ActiveRecord::Base
  belongs_to :user
  belongs_to :effort
end
