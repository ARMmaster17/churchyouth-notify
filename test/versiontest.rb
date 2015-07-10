require_relative "../test_helper"
require "test/unit"
require 'rack/test'
require_relative '../main'
require_relative '../inc/config'
require 'json'

class TestVersion < Test::Unit::TestCase
  self.test_order = :defined
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
  def test_setup
    get '/setup'
    assert last_response.ok?
  end
  def test_setupcallback
    post '/setup/callback', :ward => "Test ward", :qa => ["qd","qt","qp"], :ca => ["cb","cm","cl"]
    assert !last_response.ok?
    assert File.exists?(File.expand_path("./config/config.json"))
    configs = File.open(File.expand_path("./config/config.json"))
    jsondata = JSON.parse(configs.read)
    assert jsondata['ward'] = "Test ward"
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
  def test_homepage
    get '/'
    assert last_response.ok?
  end
  def test_reset
    Config.factoryreset
  end
end
