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

  it 'has votes' do
    expect(post).to respond_to :votes
  end

  describe '.votes_total' do
 
    it 'should correctly calculate positive votes count' do
      post = Post.create(title: 'Hello world')
      post.stub upvotes: [double(:vote), double(:vote)]
      post.stub downvotes: [double(:vote)]
      expect(post.votes_total).to eq 1
    end

    it 'should correctly calculate positive votes count' do
      post = Post.create(title: 'Hello world')
      post.stub upvotes: [double(:vote)]
      post.stub downvotes: [double(:vote), double(:vote)]
      expect(post.votes_total).to eq -1
    end

    it 'should return nil if there are no votes' do
      post = Post.create(title: 'Hello world')
      post.stub upvotes: []
      post.stub downvotes: []
      expect(post.votes_total).to be_nil
    end

end

  context '.sorted_by_votes' do

    it 'puts highly voted posts first' do
      popular = Post.new(title: 'Hello Hammy', body: 'Hello Hammy')
      less_popular = Post.new(title: 'Hello Natty', body: 'Hello Natty')

      popular.stub votes_total: 8
      less_popular.stub votes_total: 3

      Post.stub(all: [less_popular, popular])

      expect(Post.sorted_by_votes.first).to eq popular
    end

  end


end