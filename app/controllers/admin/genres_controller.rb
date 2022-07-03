class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      @genres = Genre.all
      redirect_to request.referer
      flash[:notice] = "ゲームジャンルを追加しました"
    else
      redirect_to request.referer
      flash[:notice] = "ゲームジャンルの追加に失敗しました。同じ名前の使用または空白の場合は追加できません"
    end
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
    flash[:notice] = "ゲームジャンル情報を更新しました"
  end

  def destroy
   @genre = Genre.find(params[:id])
   @genre.destroy
   @genres = Genre.all
   redirect_to admin_genres_path
   flash[:notice] = "ゲームジャンルを削除しました"
  end


  private

  def genre_params
     params.require(:genre).permit(:name)
  end

end
