class User < ActiveRecord::Base


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
end
