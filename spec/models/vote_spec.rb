describe Vote do

  let(:upvote) { Vote.create(direction: 'up') }
  let(:downvote) { Vote.create(direction: 'down') }

  context 'introducing scope operators' do

    it 'recognises a positive vote' do
      votes = Vote.all.up
      expect(votes).to include upvote
      expect(votes).not_to include downvote
    end

    it 'recognises a negative vote' do
      votes = Vote.all.down
      expect(votes).to include downvote
      expect(votes).to_not include upvote
    end

  end



end