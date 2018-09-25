class NicetwosController < ApplicationController

  def create
   chat = Chat.find(params[:chat_id])
   nicetwo = current_user.nicetwos.new(chat_id: chat.id)
   nicetwo.save
   redirect_to topic_path(chat.topic_id)
  end

  def destroy
   chat = Chat.find(params[:id])
   nicetwo = current_user.nicetwos.find_by(chat_id: chat.id)
   nicetwo.destroy
   redirect_to topic_path(chat.topic_id)
  end

end
