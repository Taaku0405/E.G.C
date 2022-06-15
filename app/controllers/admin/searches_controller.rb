class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "投稿"
      @items = Item.looks(params[:search], params[:word]).page(params[:page]).per(10)
    elsif @range == "ジャンル"
      @genres = Genre.looks(params[:search], params[:word]).page(params[:page]).per(10)
    elsif @range == "ニックネーム"
      @customers = Customer.looks(params[:search], params[:word]).page(params[:page]).per(10)
    end
    @genre = Genre.new
  end
end
