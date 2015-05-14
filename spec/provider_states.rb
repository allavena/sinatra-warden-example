require 'warden'
include Rack::Test::Methods
include Warden::Test::Helpers
require 'minitest'

Pact.provider_states_for "Consumer" do

  set_up do
  end

  tear_down do
  end


  provider_state "user is logged in" do
    set_up do
      puts "Setting up the provider state"
      user= User.get_first_user
      login_as user
    end
  end

  provider_state "user is not logged in" do
    no_op
  end
end
