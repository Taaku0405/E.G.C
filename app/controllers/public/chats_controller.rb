class Public::ChatsController < ApplicationController

  def new
  end

  def index
  end

  def show
  @chat = Chat.find(params[:id])
  end

  def edit
  end

  def create
    @group = Group.find(params[:group_id])
    @chat = current_user.chats.new(chat_params)
    @chat.group_id = @group.id
    if @chat.save
      redirect_to request.referer
      flash[:notice] = "メッセージを送信しました"
    else
      redirect_to request.referer
      flash[:notice] = "空白では送信できません"
    end
  end

  def destroy
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end
