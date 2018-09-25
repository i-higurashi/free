class RenameTopicImageColumnToTopics < ActiveRecord::Migration[5.2]
  def change
  	rename_column :topics, :topic_image, :topic_image_id
  end
end
