class Chat < ApplicationRecord
	belongs_to :topic
	belongs_to :user

	attachment :talk_image

    validates :talk, presence: true,
                     length: { minimum: 1}

  has_many :nicetwos, dependent: :destroy

  def nicetwod_by?(user)
    nicetwos.where(user_id: user.id).exists?
  end


end
