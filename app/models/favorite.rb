class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :bank_post
	validates :user_id, uniqueness: { scope: :bank_post_id }
end
