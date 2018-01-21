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

  get '/two_player_signup' do
    haml :two_player_signup
  end

  post '/names' do
    session[:player_one] = params[:player_one]
    session[:player_two] = params[:player_two]
    redirect '/player_one_choice'
  end

  get '/player_one_choice' do
    @player_name = session[:player_one]
    haml :player_one_choice
  end

  post '/player_one_choice' do
    session[:player_one_choice] = params[:player_choice].downcase.to_sym
    redirect '/player_two_choice'
  end

  get '/player_two_choice' do
    @player_name = session[:player_two]
    haml :player_two_choice
  end

  post '/player_two_choice' do
    session[:player_two_choice] = params[:player_choice].downcase.to_sym
    haml :pause
  end

  get '/result' do
    @result = Result.new(session)
    haml :result
  end
end
