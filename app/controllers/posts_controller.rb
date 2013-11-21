class PostsController < ApplicationController

  def index
    @posts = Post.sorted_by_votes
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params[:post].permit(:title, :body)

    if @post.save
      flash[:notice] = "Post saved"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

end



