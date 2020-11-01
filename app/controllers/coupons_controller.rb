class CouponsController < ApplicationController
  def target
  end

  def index
  	@coupons = Coupon.where(user_id: current_user.id, is_valid: true)
  end

  def show
  	@coupon = Coupon.find(params[:id])
  end
end
