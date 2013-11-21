class Post < ActiveRecord::Base

  has_many :comments
  has_many :votes

  validates :title, presence: true,
    length: {minimum: 2}


  def votes_total
    return nil if (upvotes + downvotes).empty?
    upvotes.size - downvotes.size
  end

  def self.sorted_by_votes
    all.sort_by(&:votes_total).reverse
  end

  private

    def upvotes
      votes.up
    end

    def downvotes
      votes.down
    end

end 
