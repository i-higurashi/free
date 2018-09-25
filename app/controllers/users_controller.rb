class UsersController < ApplicationController

   def index
    @users = User.search(params[:search]).order("created_at DESC")
    @user = current_user
    @topic = Topic.new
    @user_ranking = User.all.order("created_at DESC").limit(7)
   end

   def show
   	@user = User.find(params[:id])
   	@genre = Genre.find(@user.user_genre_id)
   	@topics = Topic.where(user_id: @user.id).order("created_at DESC").limit(10)
    @favorites = @user.favorites.order("created_at DESC").limit(10)

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

   def topicuser
    @user = User.find(params[:id])
    @genre = Genre.find(@user.user_genre_id)
    @topics = @user.topics.order("created_at DESC")
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

   def edit
   	@user = User.find(params[:id])
   end

   def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
   end

  def top
    @user = current_user
    @users = User.all
    @usernew = current_user
    @topic = Topic.new
    @user_ranking = User.all.order("created_at DESC").limit(5)

    @topicnice = Topic.where(user_id: @user.id)
    a = @topicnice.pluck(:id)
    @mytopicnice = Nice.where(topic_id: a)

    @chatnicetwo = Chat.where(user_id: @user.id)
    a = @chatnicetwo.pluck(:id)
    @mychatnicetwo = Nicetwo.where(chat_id: a)

    d = @user.followed_users.pluck(:id)
    @topics = Topic.where(user_id: d).order("created_at DESC")

    @chatsranking = Topic.joins(:chats).group(:topic_id).order("count(*) desc").limit(10)
    @chatprofile = Chat.where('talk_image_id IS NOT NULL').order("RANDOM()").limit(9)
  end

 private
 def user_params
 	params.require(:user).permit(:name, :email, :profile, :user_image, :user_backimage, :user_genre_id)
 end


end
