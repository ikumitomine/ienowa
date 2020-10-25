class Coupon < ApplicationRecord
	belongs_to :user

	# クーポンの有効無効管理
	enum is_valid: { 'ok': true, 'ng': false }
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
			if coupon.create_at + coupon.limit.days < time && coupon.is_valid == 'ok'
				coupon.is_valid = 'ng'
				coupon.save
			end
		end
	end

end
