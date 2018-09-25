class RenameTalkImageColumnToChats < ActiveRecord::Migration[5.2]
  def change
  	rename_column :chats, :talk_image, :talk_image_id
  end
end
