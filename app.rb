require 'sinatra/base'
require 'haml'
require_relative './lib/computer.rb'
require_relative './lib/result.rb'

class RockPaperScissors < Sinatra::Base
  set :session_secret, "SecureRandom.new(10)"
  enable :sessions

  get '/' do
    haml :index
  end

  post '/name' do
    session[:player_name] = params[:name]
    redirect '/play'
  end

  get '/play' do
    @result = Result.new(session)
    haml :play
  end

  post '/play' do
    session[:player_choice] = params[:player_choice].downcase.to_sym
    session[:computer_choice] = Computer.new.choice
    redirect '/play'
  end
end
