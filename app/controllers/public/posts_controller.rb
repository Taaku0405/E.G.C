class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def index
    @posts = Post.page(params[:page]).per(8).order('created_at DESC')
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
      flash[:notice] = "ゲーム投稿を登録しました"
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    @genres = Genre.all
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "ゲーム投稿を更新しました"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    flash[:notice] = "ゲーム投稿を削除"
  end

  def search
    #ジャンル検索アクション
    @posts = Post.where(genre_id: params[:format]).page(params[:page]).per(8)
    @genres = Genre.all
    @genre = Genre.find(params[:format])
    render :index
  end

  private

  def post_params
    params.require(:post).permit(:name, :introduction, :genre_id)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
      flash[:notice] = "他のユーザーが投稿した内容は編集できません"
    end
  end

end