class Coupon < ApplicationRecord
	belongs_to :user

	# クーポンを作成するメソッド
	def self.coupon_create(user, days)
		coupon = Coupon.new(user_id: user.id, limit: days)
		coupon.save
	end
	# クーポンを自動削除するメソッド
	def self.coupon_destroy
		time = Time.now
		coupons = Coupon.all
		coupons.each do |coupon|
			# クーポンを作成してからdaysで指定した期間が経過、かつ、is_validがtrueの場合、falseに変更して保存する
			if coupon.created_at + coupon.limit.days < time && coupon.is_valid == true
				coupon.is_valid = false
				coupon.save
			end
		end
	end

end
