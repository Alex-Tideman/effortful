require 'webmock'
require 'vcr'
require 'simplecov'


VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
end

SimpleCov.start do
  add_filter 'config'
  add_filter 'application_controller'
end


RSpec.configure do |config|
  require 'database_cleaner'
  require 'capybara/rspec'

  SimpleCov.start 'rails'

  config.include Capybara::DSL

  config.after(:each) do
    DatabaseCleaner.clean
  end

  WebMock.stub_request(:any, "www.localhost:3000")


  def user
    @user ||= User.create(name: "Alex Tideman",
                       first_name: "Alex",
                       last_name: "Tideman",
                       email: "alex.tideman@gmail.com",
                       image: "default.png",
                       token: ENV['google_id'],
                       uid: "104319262166806203464",
                       provider: "google_oauth2")
  end

  def get_user
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new ({
                                                                       'provider'    => user.provider,
                                                                       'uid'         => user.uid,
                                                                       'info'        => {:name =>user.name,
                                                                                         :first_name =>user.first_name,
                                                                                         :last_name =>user.last_name,
                                                                                         :email =>user.email,
                                                                                         :image =>user.image},
                                                                       'credentials' => {:token =>user.token},
                                                                   })
  end

  def get_sponsors
    @user2 ||= User.create(name: "Alex Tideman",
                        first_name: "B",
                        last_name: "C",
                        email: "0alex.tideman@gmail.com",
                        image: "default.png",
                        role: "Sponsor")
    @user3 ||= User.create(name: "Alex Tideman",
                        first_name: "D",
                        last_name: "E",
                        email: "1alex.tideman@gmail.com",
                        image: "default.png",
                        role: "Sponsor")
    @user4 ||= User.create(name: "Alex Tideman",
                        first_name: "F",
                        last_name: "E",
                        email: "2alex.tideman@gmail.com",
                        image: "default.png",
                        role: "Sponsor")
    @user5 ||= User.create(name: "Alex Tideman",
                        first_name: "G",
                        last_name: "H",
                        email: "3alex.tideman@gmail.com",
                        image: "default.png",
                        role: "Sponsor")
    @user6 ||= User.create(name: "Alex Tideman",
                        first_name: "I",
                        last_name: "J",
                        email: "4alex.tideman@gmail.com",
                        image: "default.png",
                        role: "Sponsor")
    @user7 ||= User.create(name: "Alex Tideman",
                        first_name: "K",
                        last_name: "M",
                        email: "5alex.tideman@gmail.com",
                        image: "default.png",
                        role: "Sponsor")
    @user8 ||= User.create(name: "Alex Tideman",
                        first_name: "N",
                        last_name: "0",
                        email: "6alex.tideman@gmail.com",
                        image: "default.png",
                        role: "Sponsor")

    @user9 ||= User.create(name: "Alex Tideman",
                           first_name: "P",
                           last_name: "Q",
                           email: "8alex.tideman@gmail.com",
                           image: "default.png",
                           role: "Volunteer")

  end

end


