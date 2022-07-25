class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @group =Group.new
  end

  def index
    @groups = Group.all.page(params[:page]).per(10)
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
  end

  def group_chat
    @group = Group.find(params[:id])
    @chat = Chat.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
      flash[:notice] = "グループの作成に成功しました"
    else
      render 'new'
      flash[:notice] = "グループの作成に失敗しました。再度確認してください"
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
      flash[:notice] = "グループの情報を更新しました"
    else
      render "edit"
      flash[:notice] = "グループの情報の更新に失敗しました。再度確認してください"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image)
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
      flash[:notice] = "グループオーナー以外は編集できません"
    end
  end

end
