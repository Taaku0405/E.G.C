class Public::SearchesController < ApplicationController
  def search
    @posts = Post.looks(params[:search], params[:word]).page(params[:page]).per(10)
    @genres = Genre.all
  end
end
