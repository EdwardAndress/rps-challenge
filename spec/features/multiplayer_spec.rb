require 'spec_helper'

describe 'A game between two humans' do
  before(:each) { human_vs_human_sign_in }

  describe 'starting a game' do
    it 'both players are greeted' do
      expect(page).to have_content('Welcome Eddie and Andreia!')
    end
  end

  describe "taking turns" do
    it "whilst player 2 is asked to look away" do
      expect(page).to have_content("No peeking, Andreia!")
    end

    it "player can choose a weapon" do
      click_button 'Rock'
      expect(page).to have_content('Andreia, choose your weapon')
    end

    before { click_button 'Rock' }

    it 'whilst player 1 is asked to look away' do
      expect(page).to have_content('No peeking, Eddie!')
    end

    it 'player 2 can choose a weapon' do
      click_button 'Paper'
      expect(page).to have_content('Click to see the result')
    end
  end
end

def human_vs_human_sign_in
  visit '/'
  click_button 'Human vs Human'
  fill_in :player_one, with: 'Eddie'
  fill_in :player_two, with: 'Andreia'
  click_button 'Play'
end
