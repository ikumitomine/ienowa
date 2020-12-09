class CouponsController < ApplicationController

  before_action :correct_user, only: [:show]

  def target
  end

  def index
    @coupons = Coupon.where(user_id: current_user.id, is_valid: true)
  end

  def show
	@coupon = Coupon.find(params[:id])
  end

  private
    # before_action
    def correct_user
      @correct_user = current_user.coupons.find_by(id: params[:id])
      unless @correct_user
      redirect_to root_path
    end
  end

end
