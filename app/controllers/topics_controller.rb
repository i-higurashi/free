class TopicsController < ApplicationController

    def index
      @topics = Topic.search(params[:search]).order("created_at DESC")
      @usernew = current_user
      @topic = Topic.new
      @user_ranking = User.all.order("created_at DESC").limit(7)
      @chatsranking = Topic.joins(:chats).group(:topic_id).order("count(*) desc").limit(10)
      @user = current_user

      @topicnice = Topic.where(user_id: @user.id)
      a = @topicnice.pluck(:id)
      @mytopicnice = Nice.where(topic_id: a)

      @chatnicetwo = Chat.where(user_id: @user.id)
      a = @chatnicetwo.pluck(:id)
      @mychatnicetwo = Nicetwo.where(chat_id: a)
    end

    def show
      @topic = Topic.find(params[:id])
      @newchat = Chat.new(:topic_id => params[:id]) #ここを追加
      @chats = Chat.where(topic_id: params[:id])
    end

    def new
      @user = current_user
      @topic = Topic.new
    end

    def create
      @topic = Topic.new(topic_params)
      @topic.user_id = current_user.id
      @user = current_user
      @topic.save
      redirect_to user_path(current_user)
    end

	def destroy
	    @topic = Topic.find(params[:id])
	    @topic.destroy
	    redirect_to user_path(current_user)
	end

    private

    def topic_params
        params.require(:topic).permit(:title, :body, :topic_image)
    end

end
