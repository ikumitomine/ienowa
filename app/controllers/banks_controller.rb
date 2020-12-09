class BanksController < ApplicationController

  def index
    @search_params = loan_search_params
    # 銀行ごとに最安金利を表示するため、銀行のid・名前と、銀行に紐付くローンの最安値の組み合わせの配列を取得する。
    # つまり、loanのfkである銀行id単位にrateの最小値を取得する。
    @banks = Loan.joins(:bank).search(@search_params).group(:bank_id).order(rate: "ASC").pluck("banks.id,banks.name,min(loans.rate)")
  end

  def show
    @bank = Bank.find(params[:id])
    @loans = @bank.loans.page(params[:page]).order("borrowing_year DESC").order("borrowing_month DESC").per(5)
    @loan = @bank.loans
    @min_rate = @loan.order("rate").pluck("min(loans.rate)") # 最安金利
    @average_rate = @loan.order("rate").pluck("avg(loans.rate)") # 平均金利
    @search_params = loan_search_params

    # チャート表記用のデータを整形
    @loan = @bank.loans
    @aggregate_rate = Chart.new(@bank).aggregate_rate
    @aggregate_age = Chart.new(@bank).aggregate_age
    @aggregate_income = Chart.new(@bank).aggregate_income
    @aggregate_family_form = Chart.new(@bank).aggregate_family_form
    @aggregate_job_period = Chart.new(@bank).aggregate_job_period

  end

  def favorites
    @banks = current_user.fav_banks
    @loans = Loan.joins(:bank).where(bank_id: @banks.ids)

    @min_rate_list = RateList.new(@banks).make_min_rate_list # 最安金利
    @average_rate_list = RateList.new(@banks).make_average_rate_list # 平均金利

    # チャート表記用のデータを整形
    @aggregate_rate_list = ChartList.new(@banks).make_aggregate_rate_list
    @aggregate_age_list = ChartList.new(@banks).make_aggregate_age_list
    @aggregate_income_list = ChartList.new(@banks).make_aggregate_income_list
    @aggregate_family_form_list = ChartList.new(@banks).make_aggregate_family_form_list
    @aggregate_job_period_list = ChartList.new(@banks).make_aggregate_job_period_list
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