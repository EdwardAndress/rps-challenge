require 'spec_helper'

context 'Having played a game' do

  before { play_once }

  describe 'the play again button' do
    it 'redirects to the weapon choice page' do
      click_button 'Play again'
      expect(page).to have_content('Welcome back eddie')
    end
  end
end

def play_once
  visit('/')
  fill_in :name, with: 'eddie'
  click_button 'Play'
  click_button 'Rock'
end
