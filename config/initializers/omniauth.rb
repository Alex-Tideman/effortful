require "omniauth-google-oauth2"

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE if Rails.env.development?

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['google_id'], ENV['google_secret'],
    {
        name: 'google',
        scope: 'email,profile,plus.me',
        :prompt => "select_account",
        image_aspect_ratio: 'square',
        image_size: 48,
        access_type: 'offline',
    }
end
