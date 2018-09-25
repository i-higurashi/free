class ChatsController < ApplicationController

  def create
    @chat = Chat.new(params[:chat].permit(:topic_id, :talk, :talk_image))
    @chat.user_id = current_user.id
   if
  	@chat.save
  	redirect_to topic_path(params[:chat][:topic_id])
   else
    redirect_to topic_path(params[:chat][:topic_id])
   end
  end
end
