class AttributePostsController < ApplicationController
  def post
  end

  def new
  	@attribute_post = AttributePost.new
  end

  def create
    # attribute_postで入力された値をsessionに保存
    session[:age] = attribute_post_params[:age]
    session[:sex] = attribute_post_params[:sex]
    session[:family_form] = attribute_post_params[:family_form]
    session[:emoloyment_status] = attribute_post_params[:emoloyment_status]
    session[:length_job] = attribute_post_params[:length_job]
    session[:income] = attribute_post_params[:income]
    session[:listed] = attribute_post_params[:listed]
  end

  private
  def attribute_post_params
  	params.require(:attribute_post).permit(
      :user_id,
      :age,
      :sex,
      :family_form,
      :employment_status,
      :length_job,
      :income,
      :listed
      )
  end

end