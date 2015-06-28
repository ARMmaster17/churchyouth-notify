include 'sinatra'
include 'slim'

get '/' do
  slim :home
end
