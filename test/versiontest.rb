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
    post '/setup/callback', :admin = "00000", :ward => "Test ward", :qa => ["qd","qt","qp"]
    assert !last_response.ok?
    Config.factoryreset
  end
  def test_setupcallback2
    post '/setup/callback', :admin = "00000", :ward => "Test ward"
    assert !last_response.ok?
    Config.factoryreset
  end
  def test_setupcallback3
    post '/setup/callback', :admin = "00000", :ward => "Test ward", :qa => ["qd","qt","qp"], :ca => ["cb","cm","cl"]
    assert !last_response.ok?
  end
  def test_setupcallback4
    assert File.exists?(File.expand_path("./config/config.json"))
    configs = File.open(File.expand_path("./config/config.json"))
    jsondata = JSON.parse(configs.read)
    assert_equal(jsondata['ward'], "Test ward")
  end
  def test_staticprivacy
    get '/static/privacy'
    assert last_response.ok?
  end
  def test_accountlogin
    get '/account/login'
    assert last_response.ok?
  end
  def test_accountprocess
    post '/account/process', :uname => "Test user"
    assert !last_response.ok?
  end
  def test_dashboardhome
    get '/dashboard/home'
    assert last_response.ok?
  end
  def test_dashboardemailcreate
    get '/dashboard/email/create'
    assert last_response.ok?
  end
  def test_varstore
    require_relative '../inc/pagevars'
    assert_equal(Pagevars.setVars("noexist"), "Error")
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
  end
  def test_apimailvalidate2
    get '/api/mail/validate?m=user@test.org'
    assert last_response.body = "true"
  end
  def test_apimailvalidate3
    get '/api/mail/validate?m=user@test.net'
    assert last_response.body = "true"
  end
  def test_apimailvalidate4
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
