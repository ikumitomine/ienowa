class BankPost < ApplicationRecord
	#bank_postとattribute_postを中間テーブルattribute_bankでつなぐ
  	has_many :attribute_banks
  	has_many :attribute_posts, through: :attribute_banks

	belongs_to :user
	has_many :favorites, dependent: :destroy
	# 引数で渡されたユーザidがFavoritesテーブル内に存在するかどうかを調べる
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end
