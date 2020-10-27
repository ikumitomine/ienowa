class Bank < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :loans, dependent: :destroy
	# 引数で渡されたuser_idがFavoritesテーブル内に存在するかどうかを調べる
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
