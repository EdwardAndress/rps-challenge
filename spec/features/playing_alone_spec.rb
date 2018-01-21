require 'spec_helper'

describe 'A game between a humanan and the computer' do
  context 'human player selects Rock' do
    before do
      sign_in
      click_button 'Rock'
    end

    it 'response code is 200' do
      expect(page.status_code).to eq 200
    end

    it 'an intermediate screen is shown' do
      expect(page).to have_content("Click below to do battle")
    end

    it 'the outcome is shown' do
      click_link 'Fight'
      expect(page).to have_content("After a long and heroic struggle")
      expect(page).to have_content("Computer")
      expect(page).to have_content("Eddie")
    end
  end
end

def sign_in
  visit('/')
  click_link 'Human vs Computer'
  fill_in :player_one, with: 'Eddie'
  click_button 'Play'
end
