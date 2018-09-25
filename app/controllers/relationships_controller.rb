class RelationshipsController < ApplicationController

  def follow
  	user = User.find(params[:id])
  	if current_user.following?(user)
       current_user.unfollow!(user)
  	else
  	   current_user.follow!(user)
  	end
    redirect_to top_path
  end

  def follow_p
    @user = User.find(params[:id])
    @myuser = current_user
    @topic = Topic.new
    @user_ranking = User.all.order("created_at DESC").limit(7)
  end

  def followed_p
    @user = User.find(params[:id])
    @myuser = current_user
    @topic = Topic.new
    @user_ranking = User.all.order("created_at DESC").limit(7)
  end

end
