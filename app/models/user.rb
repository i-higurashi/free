class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :user_image
  attachment :user_backimage

  has_many :topics
  has_many :genre, through: :user_genre
  has_many :user_genre
end
