class HomesController < ApplicationController

  def introduction
   @topics = Topic.all
   @chats = Chat.all
   @nices = Nice.all
   @nicetwos = Nicetwo.all
  end

  def sign
  end
end