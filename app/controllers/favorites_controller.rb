class FavoritesController < ApplicationController

  def index
    @user = current_user
    @favorite = Favorite.where(user_id: @user.id).all.order("created_at DESC")
    @genre = Genre.find(@user.user_genre_id)
    @topicnice = Topic.where(user_id: @user.id)
    a = @topicnice.pluck(:id)
    @mytopicnice = Nice.where(topic_id: a)

    @chatnicetwo = Chat.where(user_id: @user.id)
    a = @chatnicetwo.pluck(:id)
    @mychatnicetwo = Nicetwo.where(chat_id: a)

    @usernew = current_user
    @topic = Topic.new

    @chatsranking = Topic.joins(:chats).group(:topic_id).order("count(*) desc").limit(10)
  end

  def create
    user = current_user
    topic = Topic.find(params[:topic_id])
    if Favorite.create(user_id: user.id, topic_id: topic.id)
    redirect_to top_path
    else
    redirect_to top_path
    end
  end

  def destroy
    user = current_user
    topic = Topic.find(params[:topic_id])
    if favorite = Favorite.find_by(topic_id: user.id, topic_id: topic.id)
      favorite.delete
      redirect_to top_path
    else
      redirect_to top_path
    end
   end
end
