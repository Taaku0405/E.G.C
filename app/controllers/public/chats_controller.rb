class Public::ChatsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @chat = current_user.chats.new(chat_params)
    @chat.group_id = @group.id
    @chat.save
  end

  def destroy
    @chat = Chat.find_by(id: params[:id], group_id: params[:group_id])
    @chat.destroy
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end
