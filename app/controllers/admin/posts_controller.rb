class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all.page(params[:page]).per(10).order('created_at DESC')
    @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def update
    @genres = Genre.all
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_post_path(@post)
      flash[:notice] = "ゲーム投稿情報を更新しました"
    else
      render :edit
      flash[:notice] = "ゲーム投稿情報の更新に失敗しました。再度確認してください"
    end
  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   redirect_to admin_posts_path
   flash[:notice] = "ゲーム投稿情報を削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:name, :introduction, :genre_id)
  end

end
