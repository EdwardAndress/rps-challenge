require 'spec_helper'

describe 'arriving at the RPS site' do
  it 'a user is greeted appropriately' do
    visit '/'
    expect(page).to have_content('Time to relax with some RPS')
  end
end
