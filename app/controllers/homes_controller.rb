class HomesController < ApplicationController
   layout 'top'

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
