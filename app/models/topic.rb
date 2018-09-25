class Topic < ApplicationRecord

  has_many :favorites
  has_many :users, through: :favorites
  belongs_to :user
  attachment :topic_image

  has_many :chats

  has_many :nices, dependent: :destroy



  def self.search(search) #self.でクラスメソッドとしている
	  if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
	      Topic.where(['title LIKE ?', "%#{search}%"])
	  else
	      Topic.all #全て表示。
	  end
  end


  def niced_by?(user)
    nices.where(user_id: user.id).exists?
  end

end
