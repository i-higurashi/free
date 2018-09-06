class CreateNicetwos < ActiveRecord::Migration[5.2]
  def change
    create_table :nicetwos do |t|
      t.integer :chat_id
      t.integer :user_id

      t.timestamps
    end
  end
end
