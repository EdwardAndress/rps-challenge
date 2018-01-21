require 'spec_helper'

describe 'A game between two humans' do
  before(:each) { human_vs_human_sign_in }

  describe "Players take turns" do
    it "choosing weapons" do
      # greeting player one
      expect(page).to have_content("Eddie, choose your weapon!")
      # player one chooses
      click_button 'Rock'
      # greeting player two
      expect(page).to have_content('Andreia, choose your weapon')
      # player 2 chooses
      click_button 'Paper'
      # tension builder
      expect(page).to have_content('Click below to do battle')
    end
  end

  describe 'The result is shown' do
    it 'after an intervening page' do
      choose_weapons
      click_link 'Fight!'
      expect(page).to have_content('After a long and heroic struggle...')
      expect(page).to have_content('Andreia emerges victorious')
    end
  end
end

def human_vs_human_sign_in
  visit '/'
  click_link 'Human vs Human'
  fill_in :player_one, with: 'Eddie'
  fill_in :player_two, with: 'Andreia'
  click_button 'Play'
end

def choose_weapons
  click_button 'Rock'
  click_button 'Paper'
end
