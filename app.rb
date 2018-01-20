require 'sinatra/base'
require 'haml'
require_relative './lib/computer.rb'
require_relative './lib/result.rb'

class RockPaperScissors < Sinatra::Base
  get '/' do
    haml :index
  end

  post '/games/new' do
    player_name = params[:name]
    haml :new_game, locals: { player_name: player_name }
  end

  post '/turns/new' do
    computer_choice = Computer.new.choice
    player_choice = params[:player_choice].downcase.to_sym
    result = Result.new(player_choice, computer_choice)
    haml :result,
     locals: {
       computer_choice: computer_choice,
       player_choice: player_choice,
       result: result
     }
  end
end
