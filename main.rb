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
    if File.exists?(File.dirname(__FILE__) + "/config/config.json")
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
  quorumarray = params[:qa]
  classarray = params[:ca]
  warddata = params[:ward]
  quorumstring = quorumarray.map(&:inspect).join(',')
  classstring = classarray.map(&:inspect).join(',')
  begin
    file = File.open(File.dirname(__FILE__) + "/config/config.json", "w")
    file.write('{ "ward":"#{warddata}","classes":{ #{classstring} },"quorums":{ #{quorumstring} }}') 
    file.close()
  rescue IOError => e
    "An error has occured. Please send this code to the developer: 0x00 CONFIGSTOREIOERR"
    ioerr = true
  ensure
    file.close unless file.nil?
  end
  if !ioerr
    redirect "/"
  end
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
