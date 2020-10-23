class BankPostsController < ApplicationController

	def new
		@bank_post = BankPost.new
	end

	def create
	    # bank_postで入力された値をsessionに保存
	    session[:borrowing_year] = bank_post_params[:borrowing_year]
	    session[:borrowing_month] = bank_post_params[:borrowing_month]
	    session[:name] = bank_post_params[:name]
	    session[:rate] = bank_post_params[:rate]
	    session[:borrowing_length] = bank_post_params[:borrowing_length]
	    session[:payment] = bank_post_params[:payment]
	    session[:rate_type] = bank_post_params[:rate_type]
	    session[:borrowing_form] = bank_post_params[:borrowing_form]
	    session[:bought_place] = bank_post_params[:bought_place]
	    session[:reason] = bank_post_params[:reason]
  	end

  	def index
  		@bank_posts = BankPost.all
  	end

  	def show
  		@bank_post = BankPost.find(params[:id])
  		@attribute_post = AttributePost.find(params[:id])
  	end

  	def favorite
  		@coupon = Coupon.find(params[:id])
  	end

	private
	def bank_post_params
	  	params.require(:bank_post).permit(
		    :user_id,
		    :borrowing_year,
			:borrowing_month,
			:name,
			:rate,
			:borrowing_length,
			:payment,
			:rate_type,
			:borrowing_form,
			:bought_place,
			:reason
	    )
    end

end
