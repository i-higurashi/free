class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :talk
      t.string :talk_image
      t.integer :reply
      t.integer :topic_id
      t.integer :user_id

      t.timestamps
    end
  end
end
