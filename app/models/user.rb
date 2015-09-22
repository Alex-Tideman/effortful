class User < ActiveRecord::Base

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.name =  data.info.name
    user.email =  data.info.email
    user.location = data.info.location
    user.image_url = data.info.image_url
    user.token = data.credentials.token
    user.save
    user
  end
end
