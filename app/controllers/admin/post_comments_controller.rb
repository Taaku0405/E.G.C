class Admin::PostCommentsController < ApplicationController
  
  def destroy
    @post_comment = PostComment.find_by(id: params[:id], post_id: params[:post_id])
    @post_comment.destroy
  end 

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end 

end
