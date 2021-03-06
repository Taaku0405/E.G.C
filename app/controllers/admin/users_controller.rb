class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
      flash[:notice] = "会員情報を更新しました"
    else
      render :edit
      flash[:notice] = "会員情報の更新に失敗しました。再度確認してください"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :email, :is_deleted)
  end

end
