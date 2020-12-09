class HomesController < ApplicationController
    layout 'top'

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザとしてログインしました。'
  end

	def top
		@search_params = loan_search_params
	end

	def about
	end

	private
	def loan_search_params
    # 検索のパラメータ設定
    params.fetch(:search, {}).permit(
      :family_form,
      :employment_status,
      :job_period,
      :bought_place,
      :age_from,
      :age_to,
      :income_from,
      :income_to
      )
  end
end
