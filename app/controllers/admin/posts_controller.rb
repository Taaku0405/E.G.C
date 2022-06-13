class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_post_path(@post), notice: "ゲームの投稿情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :introduction, :genre_id)
  end

end
