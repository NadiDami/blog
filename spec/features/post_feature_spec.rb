

def create_a_post
  Post.create(title: 'Hello world', body: 'Helllooooo')
end


describe 'blog posts index page' do

  it 'should display a list of posts' do
    create_a_post
    visit '/posts'
    expect(page).to have_content "Hello world"
  end

  it 'can be reached from the homepage' do
    visit '/'
    click_link 'My blog'
    expect(page).to have_content 'Posts'
  end

  it 'can show individual posts' do
    create_a_post
    visit '/posts'
    click_link "Hello world"
    expect(page).to have_content 'Helllooooo'
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

describe 'editing a saved post' do

  it 'can be edited on the Edit form' do
    create_a_post
    visit '/posts'
    click_link 'Hello world'
    click_link 'Edit'
    fill_in 'Body', with: 'Lorem ipso'
    click_button 'Save post'
    expect(page).to have_content 'Lorem ipso'
  end
end

end