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
    post '/setup/callback', :ward => "Test ward", :qa => ["qd","qt","qp"]
    assert !last_response.ok?
    Config.factoryreset
    post '/setup/callback', :ward => "Test ward"
    assert !last_response.ok?
    Config.factoryreset
    post '/setup/callback', :ward => "Test ward", :qa => ["qd","qt","qp"], :ca => ["cb","cm","cl"]
    assert !last_response.ok?
    assert File.exists?(File.expand_path("./config/config.json"))
    configs = File.open(File.expand_path("./config/config.json"))
    jsondata = JSON.parse(configs.read)
    assert_equal(jsondata['ward'], "Test ward")
  end
  def test_staticprivacy
    get '/static/privacy'
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
    assert_equal(JSON.parse(last_response.body)['ward'], 'Test ward')
  end
  def test_apimailvalidate
    get '/api/mail/validate?m=user@test.com'
    assert last_response.body = "true"
    get '/api/mail/validate?m=user@test.org'
    assert last_response.body = "true"
    get '/api/mail/validate?m=user@test.net'
    assert last_response.body = "true"
    get '/api/mail/validate?m=user@test.nz'
    assert last_response.body = "false"
  end
  def test_homepage
    get '/'
    assert last_response.ok?
  end
  def test_reset
    Config.factoryreset
  end
end
