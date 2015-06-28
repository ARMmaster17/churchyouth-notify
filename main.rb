include 'sinatra'
include 'slim'

get '/' do
  slim :home
end

get '/api' do
  "200 Version: ERROR"
end
