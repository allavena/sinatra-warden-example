require_relative '../app'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

include Rack::Test::Methods
include Warden::Test::Helpers

describe SinatraWardenExample do
  def app
    SinatraWardenExample
  end


  it 'says hello' do
    s= get '/json'
    result= {hello: 'world'}.to_json
    s.body.must_equal result
  end

  it 'is redirected when going to the protected page' do
    s= get '/json/protected'
    s.status.must_equal 302
  end

  it 'get the protected content when logging in' do
    post '/json/login', {'user[username]' => 'admin', 'user[password]' =>  'admin'}
    s= get '/json/protected'
    s.status.must_equal 200
    s.body.must_equal ({secret: 'stuff'}.to_json )
  end

  it 'get the protected content when using Warden helper' do
    user= User.get_first_user
    login_as user
    s= get '/json/protected'
    s.status.must_equal 200
    s.body.must_equal ({secret: 'stuff'}.to_json )
  end


end