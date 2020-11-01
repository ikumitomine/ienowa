class CouponsController < ApplicationController
  def target
  end

  def index
  	@coupons = Coupon.where(user_id: current_user.id, is_valid: true)
  end

  def show
  	@coupon = Coupon.find_by(params[:id], is_valid: true)
  end
end
