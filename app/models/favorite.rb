class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :bank
	validates :user_id, uniqueness: { scope: :bank_id }
end
