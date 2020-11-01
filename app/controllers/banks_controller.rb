class BanksController < ApplicationController
  def index
    @search_params = loan_search_params
    # 銀行ごとに最安金利を表示するため、
    # 銀行のid・名前と、銀行に紐付くローンの最安値の組み合わせの配列を取得する。
    # つまり、loanのfkである銀行id単位にrateの最小値を取得する。
  	@banks = Loan.joins(:bank).search(@search_params).group(:bank_id).order("rate ASC").pluck("banks.id,banks.name,min(loans.rate)")
  end

  def show
      @bank = Bank.find(params[:id])
      @loans = @bank.loans.page(params[:page]).order("borrowing_year DESC").order("borrowing_month DESC").per(5)
      # @loans = Bank.where(id: params[:id]).joins(:loans).merge(Loans.search(@search_params)).order("borrowing_year DESC").order("borrowing_month DESC").per(5)
  end

  def favorites
  	@banks = current_user.fav_banks.includes(:user)
  end

  private
  def loan_search_params
    # 検索のパラメータ設定
    params.permit(
      :family_form,
      :employment_status,
      :job_period,
      :bought_place,
      :age_from,
      :age_to,
      :income_from,
      :income_to,
      )
  end
end