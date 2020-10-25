class CouponsController < ApplicationController
  def target
  end

  def index
  	@coupons = Coupon.where(user_id: current_user.id, is_valid: 'ok')
  end

  def show
  	@coupon = Coupon.find(params[:id])
  end
# 詳細ページでも有効のものを表示させる.where(is_valid: 'ok')
end
