require 'spec_helper'

def create_a_post
  Post.create(title: 'Hello world', body: 'Helllooooo')
end

describe 'voting' do
  
  it 'keeps track of the vote totals' do
    create_a_post
    visit '/posts'
    click_button '⬆'
    expect(page).to have_css '.votes-count', text: '1'
  end


end