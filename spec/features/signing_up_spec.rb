require 'spec_helper'

describe 'a human signs up to play vs the computer' do
  it "and see's their name on the following page" do
    visit '/'
  	click_link 'Human vs Computer'
    fill_in :player_one, with: 'Eddie'
    click_button 'Play'
    expect(page).to have_content('Eddie, choose your weapon!')
  end
end

describe 'two humans sign up to play against one another' do
  it "and see their names on the following page" do
    visit '/'
  	click_link 'Human vs Human'
    fill_in :player_one, with: 'Eddie'
    fill_in :player_two, with: 'Andreia'
    click_button 'Play'
    expect(page).to have_content('Eddie, choose your weapon!')
  end
end
