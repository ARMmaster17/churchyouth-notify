#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'slim'
require 'rest-client'
require 'json'
require_relative 'inc/api'
require_relative 'inc/mail'
require_relative 'inc/pagevars'
require_relative 'inc/config'

enable :sessions

helpers do
  def login?
    return false
  end
  def configured?
    if File.exists(File.dirname(__FILE__) + "config.json")
      return true
    else
      return false
    end
  end
end

get '/' do
  if configured?
    @PageTitle = 'Home'
    @TRAVISBUILDNUMBER = Pagevars.setVars("CIbuild")
    @configWard = Config.getVar("ward")
    slim :home
  else
    redirect '/setup'
  end
end
get '/setup' do
  if configured?
    redirect '/'
  else
    slim :setupapp
  end
end
post '/setup/callback' do
  # Send configuration to config file
  classquorumarray = params[:cq]
  warddata = params[:ward]
  #TODO: add interface to config file
end
get '/api' do
  API.a()
end
get '/api/mail/validate' do
  API.mailvalidate(:params['m'])
end
get '/api/config' do
  # return config in JSON
  return 'ERROR: NotImplemented'
end
get '/api/config/ward' do
  return '{ "ward":"#{Config.getVar("ward")}" }'
end
