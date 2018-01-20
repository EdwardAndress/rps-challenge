class Result
  attr_reader :player_choice, :computer_choice, :player_name

  def initialize(session)
    @player_name = session['player_name']
    @player_choice = session['player_choice']
    @computer_choice = session['computer_choice']
  end

  def description
    outcomes[player_choice][computer_choice] + " WON"
  end

  private

  def outcomes
    {
      rock:     { paper: 'The computer', scissors: 'You', rock: 'Nobody' },
      paper:    { paper: 'Nobody', scissors: 'The computer', rock: 'You' },
      scissors: { paper: 'You', scissors: 'Nobody', rock: 'The computer' }
    }
  end
end
