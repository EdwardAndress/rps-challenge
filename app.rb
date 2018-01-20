require 'sinatra/base'
require 'haml'

class RockPaperScissors < Sinatra::Base
  get '/' do
    haml :index
  end

  post '/games/new' do
    player_name = params[:name]
    haml :new_game, locals: { player_name: player_name }
  end
end
