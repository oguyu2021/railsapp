class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    #Post.create(post_params)
    @post = Post.new(post_params)    
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "投稿しました" 
      else
        render :new
      end
    end
  end

  def destroy                              
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def show
    @post = Post.find(params[:id])
  end
  

  private
  def post_params
    params.require(:post).permit(:name, :text)
  end


end
