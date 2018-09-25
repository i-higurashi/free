class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :user_image
  attachment :user_backimage
  validates :name, presence: true,
                   length: { minimum: 2}


  has_many :favorites
  has_many :topics
  has_many :chats

  has_many :genre, through: :user_genre
  has_many :user_genres
  has_many :nices, dependent: :destroy
  has_many :nicetwos, dependent: :destroy


  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower


  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
        User.where(['name LIKE ?', "%#{search}%"])
    else
        User.all #全て表示。
    end
  end

  def following?(other_user)
    # relationships.find_by(followed_id: other_user.id)
    followed_users.include?(other_user)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

end
