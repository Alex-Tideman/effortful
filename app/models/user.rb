class User < ActiveRecord::Base

  has_many :user_efforts
  has_many :efforts, through: :user_efforts

  validates :first_name, :last_name, :email, presence: true


  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.name =  data.info.name
    user.first_name = data.info.first_name
    user.last_name = data.info.last_name
    user.email = data.info.email
    user.image = data.info.image
    user.token = data.credentials.token
    user.gender = data.extra.gender

    user.save
    user
  end

  def sponsor_count
    sponsors_with_count = Hash.new{ |k,v| k[v] = 0 }
    self.efforts.each do |effort|
      effort.sponsors.each do |sponsor|
        sponsors_with_count[sponsor] += 1
      end
    end
    sponsors_with_count
  end

  def volunteer_count
    volunteers_with_count = Hash.new{ |k,v| k[v] = 0 }
    self.efforts.uniq.each do |effort|
        volunteers_with_count[effort.volunteer] += 1
      end
    volunteers_with_count
  end

  def member_count
    members_with_count = Hash.new{ |k,v| k[v] = 0 }
    self.efforts.uniq.each do |effort|
      members_with_count[effort.member] += 1
    end
    members_with_count
  end

  private

end
