require_relative "../test_helper"
require "test/unit"
require 'rack/test'
require_relative '../main'

class TestVersion < Test::Unit::TestCase
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
  def test_homepage
    get '/'
    assert last_response.ok?
  end
  def test_apia
    get '/api'
    assert last_response.ok?
  end
  def test_apiconfig
    get '/api/config'
    assert last_response.ok?
  end
  def test_apiconfigward
    get '/api/config/ward'
    assert last_response.ok?
  end
end
