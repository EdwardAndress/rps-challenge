require 'spec_helper'

describe 'playing a game' do

  context 'human player selects Rock' do

    before do
      sign_in
      click_button 'Rock'
    end

    it 'response code is 200' do
      expect(page.status_code).to eq 200
    end

    it 'computer choice is shown' do
      expect(page).to have_content("The computer chose")
    end

    it 'result is shown' do
      expect(page).to have_content("WON")
    end
  end
end

def sign_in
  visit ('/')
  fill_in :name, with: 'Eddie'
  click_button 'Play'
end
