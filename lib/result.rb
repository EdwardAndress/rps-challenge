class Result
  attr_reader :player_one_choice, :player_two_choice, :player_one, :player_two

  def initialize(session)
    @player_one = session['player_one']
    @player_two = session['player_two']
    @player_one_choice = session['player_one_choice']
    @player_two_choice = session['player_two_choice']
  end

  def draw?
    outcomes[player_one_choice][player_two_choice] == 'draw'
  end

  def winner
    outcomes[player_one_choice][player_two_choice]
  end

  def loser
    {player_one => player_two, player_two => player_one}[winner]
  end

  private

  def outcomes
    {
      rock:     { paper: player_two, scissors: player_one, rock: 'draw' },
      paper:    { paper: 'draw', scissors: player_two, rock: player_one },
      scissors: { paper: player_one, scissors: 'draw', rock: player_two }
    }
  end
end
