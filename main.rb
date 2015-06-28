#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'slim'
require 'rest-client'
require 'json'

get '/' do
  slim :home
end

get '/api' do
  "200 Version: ERROR"
end
