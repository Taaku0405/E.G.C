class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def index
    @posts = Post.all
    @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "ゲーム投稿を登録しました"
    else
      render :new
    end
  end

  def update
    @genres = Genre.all
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "ゲーム投稿を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def search
    #ジャンル検索アクション
    @posts = Post.where(genre_id: params[:format])
    @genres = Genre.all
    @genre = Genre.find(params[:format])
     render :index
  end

  private

  def post_params
    params.require(:post).permit(:name, :introduction, :genre_id)
  end

end
