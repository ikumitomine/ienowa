class AttributeBankPostsController < ApplicationController

  # def new
  # 	@attribute_bank_post = AttributeBankPost.new
  # end

  def comfirm
	@attribute_bank_post = AttributeBankPost.new(
  		age: session[:age],
	    sex: session[:sex],
	    family_form: session[:family_form],
	    employment_status: session[:emoloyment_status],
	    length_job: lesession[:length_job],
	    income: session[:income],
	    listed: session[:listed],
	    borrowing_year: session[:borrowing_year],
	    borrowing_month: session[:borrowing_month],
	    name: session[:name],
	    rate: session[:rate],
	    borrowing_length: session[:borrowing_length],
	    payment: session[:payment],
	    rate_type: session[:rate_type],
	    borrowing_form: session[:borrowing_form],
	    bought_place: session[:bought_place],
	    reason: session[:reason]
	    )
  	if @attribute_bank_post.save
  		redirect_to attribute_bank_posts_complete_path
  	# else
  	# 	render 'attribute_post/new'
  	end
  end

  def complete
  end

  def index
  	@attribute_posts = AttributePost.all
  	@bank_posts = BankPost.all
  end

  private
  def attribute_bank_post_params
  	params.require(:attribute_bank_post).permit(:id, :attribute_post_id, :bank_post_id)
  end

end


