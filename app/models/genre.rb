class Genre < ApplicationRecord
	has_many :users, through: :user_genre
	has_many :user_genre
end
