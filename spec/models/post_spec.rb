describe Post do
  let(:post) {Post.new(title: 'Hello world', body: 'Helllooo')}

  context 'post is valid when' do
    it 'has a title of at least 5 characters' do
      expect(post).to be_valid
    end
  end

  context 'post is invalid when' do
    it 'has no title' do
      post.title = ''
      expect(post).not_to be_valid
    end
    it 'has a title of fewer than 2 characters' do
      post.title = "H"
      expect(post).not_to be_valid
    end
  end

  it 'has comments' do
    expect(post).to respond_to :comments
  end


end

