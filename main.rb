#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'slim'
require 'rest-client'
require 'json'
require_relative 'inc/api'
require_relative 'inc/mail'

get '/' do
  slim :home
end

get '/api' do
  API.a()
end
