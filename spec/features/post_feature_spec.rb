require 'spec_helper'

def create_a_post
  Post.create(title: 'Hello world', body: 'Helllooooo')
end

describe 'posting' do


  describe 'blog posts index page' do

    it 'can be reached from the homepage' do
      visit '/'
      click_link 'My blog'
      expect(page).to have_content 'Posts'
    end

    context 'viewing format of posts' do

      before do
        create_a_post
        visit '/posts' 
      end

      it 'should display a list of posts' do
        expect(page).to have_content "Hello world"
      end

      it 'can show individual posts' do
        click_link "Hello world"
        expect(page).to have_content 'Helllooooo'
      end

      # it 'should display the time of each post' do
      #   expect(page).to have_content '10:00 1/11/13'
      # end

    end

  end

  describe 'adding a new post do' do

    it 'can be added from the New Post form' do
      visit '/posts/new'
      fill_in 'Title', :with => 'Hello world'
      fill_in 'Body', with: 'Lorem ipsum'
      click_button 'Save post'
      expect(page).to have_content 'Post saved'
    end

  end

  context 'making changes to saved posts' do

    before do
      create_a_post
      visit '/posts'
      click_link 'Hello world'
    end

    it 'can be edited on the Edit form' do
      click_link 'Edit'
      fill_in 'Body', with: 'Lorem ipso'
      click_button 'Save post'
      expect(page).to have_content 'Lorem ipso'
    end


    it 'can be deleted with the Delete button' do
      click_link 'Delete'
      expect(page).not_to have_content 'Lorem ipsum'
    end

  end

end