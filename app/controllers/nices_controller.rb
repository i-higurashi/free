class NicesController < ApplicationController

  def create
   topic = Topic.find(params[:topic_id])
   topic = current_user.nices.new(topic_id: topic.id)
   topic.save
   redirect_to topic_path(params[:topic_id])
  end

  def destroy
   topic = Topic.find(params[:id])
   nice = current_user.nices.find_by(topic_id: topic.id)
   nice.destroy
   redirect_to topic_path(topic.id)
  end
end
