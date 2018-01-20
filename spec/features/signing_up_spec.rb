require 'spec_helper'

describe 'a user signs up' do
  it "and see's their name on the following page" do
    visit '/'
    fill_in :name, with: 'Eddie'
    click_button 'Play'
    expect(page).to have_content('Eddie')
  end
end
