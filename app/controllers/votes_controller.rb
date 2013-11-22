class VotesController < ApplicationController

  def create
    puts params.inspect
    @post = Post.find(params[:post_id])
    @post.votes.create(direction: params[:direction])
    render json: { id: @post.id, votes: @post.votes_total }
  end

end
