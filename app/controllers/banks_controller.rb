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
    @loan = @bank.loans
    @min_rate = @loan.order("rate").pluck("min(loans.rate)") # 最安金利
    @average_rate = @loan.order("rate").pluck("avg(loans.rate)") # 平均金利
    @search_params = loan_search_params

    # チャート表記用のデータを整形
    @loan = @bank.loans

    @rate = @loan.pluck(:rate)
    @aggregate_rate = aggregate_rate(@bank)

    @age = @loan.pluck(:age)
    @aggregate_age = aggregate_age(@bank)

    @income = @loan.pluck(:income)
    @aggregate_income = aggregate_income(@bank)

    @family_form = @loan.pluck(:family_form)
    @aggregate_family_form = aggregate_family_form(@bank)

    @job_period = @loan.pluck(:job_period)
    @aggregate_job_period = aggregate_job_period(@bank)

  end

  def favorites
    @banks = current_user.fav_banks
    @loans = Loan.joins(:bank).where(bank_id: @banks.ids)

    @min_rate_list = min_rate_list(@banks) # 最安金利
    @average_rate_list =  average_rate_list(@banks)# 平均金利

    # チャート表記用のデータを整形
    @aggregate_rate_list = aggregate_rate_list(@banks)
    @aggregate_income_list = aggregate_income_list(@banks)
    @aggregate_age_list = aggregate_age_list(@banks)
    @aggregate_family_form_list = aggregate_family_form_list(@banks)
    @aggregate_job_period_list = aggregate_job_period_list(@banks)
  end

  # showページのグラフ表示の定義
  def aggregate_rate(bank)
    rate_count_list(bank, :rate)
  end

  def aggregate_age(bank)
    age_count_list(bank, :age)
  end

  def aggregate_income(bank)
    income_count_list(bank, :income)
  end

  def aggregate_family_form(bank)
    family_form_count_list(bank)
  end

  def aggregate_job_period(bank)
    job_period_count_list(bank)
  end

  # faboriteページの最安金利を銀行ごとに出すための定義
  def min_rate_list(banks)
    min_rate_list = {}
    banks.each do |bank|
      min_rate_list[bank.id] = bank.loans.pluck("min(loans.rate)")
    end
    min_rate_list
  end

  # faboriteページの平均金利を銀行ごとに出すための定義
  def average_rate_list(banks)
    average_rate_list = {}
    banks.each do |bank|
      average_rate_list[bank.id] = bank.loans.pluck("avg(loans.rate)")
    end
    average_rate_list
  end

  # favoriteページで各グラフの集計を銀行ごとに表示するための定義
  def aggregate_rate_list(banks)
    aggregate_rate_list = {}
    banks.each do |bank|
      aggregate_rate_list[bank.id] = rate_count_list(bank, :rate)
    end
    aggregate_rate_list
  end

  def aggregate_age_list(banks)
    aggregate_age_list = {}
    banks.each do |bank|
      aggregate_age_list[bank.id] = age_count_list(bank, :age)
    end
    aggregate_age_list
  end

  def aggregate_income_list(banks)
    aggregate_income_list = {}
    banks.each do |bank|
      aggregate_income_list[bank.id] = income_count_list(bank, :income)
    end
    aggregate_income_list
  end

  def aggregate_family_form_list(banks)
    aggregate_family_form_list = {}
    banks.each do |bank|
      aggregate_family_form_list[bank.id] = family_form_count_list(bank)
    end
    aggregate_family_form_list
  end

  def aggregate_job_period_list(banks)
    aggregate_job_period_list = {}
    banks.each do |bank|
      aggregate_job_period_list[bank.id] = job_period_count_list(bank)
    end
    aggregate_job_period_list
  end

  # 各グラフの集計範囲とラベル名を定義。count_in_rangeはモデルで定義した集計のメソッド
  def rate_count_list(bank, symbol)
    less_than_4_percent = bank.loans.count_in_range(symbol, 0, 0.39)
    percent_4 = bank.loans.count_in_range(symbol, 0.4, 0.49)
    percent_5 = bank.loans.count_in_range(symbol, 0.5, 0.59)
    percent_6 = bank.loans.count_in_range(symbol, 0.6, 0.69)
    percent_7 = bank.loans.count_in_range(symbol, 0.7, 0.79)
    percent_8 = bank.loans.count_in_range(symbol, 0.8, 0.89)
    percent_9 = bank.loans.count_in_range(symbol, 0.9, 0.99)
    percent_1 = bank.loans.count_in_range(symbol, 1, 1.99)
    more_than_2_percent = bank.loans.count_in_range(symbol, 2, 5)
    result = [["0.4%未満", less_than_4_percent],["0.4%台", percent_4],["0.5%台", percent_5],["0.6%台", percent_6],["0.7%台", percent_7],["0.8%台", percent_8],["0.9%台", percent_9],["1%台", percent_1],["2%以上", more_than_2_percent]]
  end

  def age_count_list(bank, symbol)
    age20s = bank.loans.count_in_range(symbol, 20, 29)
    age30s = bank.loans.count_in_range(symbol, 30, 39)
    age40s = bank.loans.count_in_range(symbol, 40, 49)
    age50s = bank.loans.count_in_range(symbol, 50, 59)
    age60s = bank.loans.count_in_range(symbol, 60, 69)
    other = bank.loans.count_in_range(symbol, 70, 999)
    result = [["20代",age20s],["30代",age30s],["40代",age40s],["50代",age50s],["60代",age60s],["70代以上",other]]
  end

  def income_count_list(bank, symbol)
    less_than_3_million_yen = bank.loans.count_in_range(symbol, 0, 299)
    million_yen_3_4 = bank.loans.count_in_range(symbol, 300, 499)
    million_yen_5_6 = bank.loans.count_in_range(symbol, 500, 699)
    million_yen_7_8 = bank.loans.count_in_range(symbol, 700, 899)
    million_yen_9_10 = bank.loans.count_in_range(symbol, 900, 1999)
    more_than_20_million_yen = bank.loans.count_in_range(symbol, 2000, 9999)
    result = [["300万円未満", less_than_3_million_yen],["300~400万円代", million_yen_3_4],["500~600万円代", million_yen_5_6],["700~800万円代", million_yen_7_8],["900~1000万円代", million_yen_9_10],["2000万円以上", more_than_20_million_yen]]
  end

  def family_form_count_list(bank)
    couple = bank.loans.where(family_form: "couple").count
    single = bank.loans.where(family_form: "single").count
    family = bank.loans.where(family_form: "family").count
    result = [["夫婦", couple],["単身", single],["ファミリー", family]]
  end

  def job_period_count_list(bank)
    less1year = bank.loans.where(job_period: "less1year").count
    to2year = bank.loans.where(job_period: "to2year").count
    more3year = bank.loans.where(job_period: "more3year").count
    result = [["1年未満", less1year],["1~2年", to2year],["3年以上", more3year]]
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