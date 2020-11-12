class ChartList

   # クラスの初期化メソッド
  def initialize(banks)
    @banks = banks
  end

  # 各グラフをお気に入り登録した銀行ごとに表示するためのメソッド
  def make_aggregate_rate_list
    aggregate_rate_list = {}
    @banks.each do |bank|
      aggregate_rate_list[bank.id] = aggregate_loan_rate(bank, :rate)
    end
    aggregate_rate_list
  end

  def make_aggregate_age_list
    aggregate_age_list = {}
    @banks.each do |bank|
      aggregate_age_list[bank.id] = aggregate_loan_age(bank, :age)
    end
    aggregate_age_list
  end

  def make_aggregate_income_list
    aggregate_income_list = {}
    @banks.each do |bank|
      aggregate_income_list[bank.id] = aggregate_loan_income(bank, :income)
    end
    aggregate_income_list
  end

  def make_aggregate_family_form_list
    aggregate_family_form_list = {}
    @banks.each do |bank|
      aggregate_family_form_list[bank.id] = aggregate_loan_family_form(bank)
    end
    aggregate_family_form_list
  end

  def make_aggregate_job_period_list
    aggregate_job_period_list = {}
    @banks.each do |bank|
      aggregate_job_period_list[bank.id] = aggregate_loan_job_period(bank)
    end
    aggregate_job_period_list
  end

  # 各グラフの集計範囲とラベル名を指定するためのメソッド
  def aggregate_loan_rate(bank, symbol)
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

  def aggregate_loan_age(bank, symbol)
    age20s = bank.loans.count_in_range(symbol, 20, 29)
    age30s = bank.loans.count_in_range(symbol, 30, 39)
    age40s = bank.loans.count_in_range(symbol, 40, 49)
    age50s = bank.loans.count_in_range(symbol, 50, 59)
    age60s = bank.loans.count_in_range(symbol, 60, 69)
    other = bank.loans.count_in_range(symbol, 70, 999)
    result = [["20代",age20s],["30代",age30s],["40代",age40s],["50代",age50s],["60代",age60s],["70代以上",other]]
  end

  def aggregate_loan_income(bank, symbol)
    less_than_3_million_yen = bank.loans.count_in_range(symbol, 0, 299)
    million_yen_3_4 = bank.loans.count_in_range(symbol, 300, 499)
    million_yen_5_6 = bank.loans.count_in_range(symbol, 500, 699)
    million_yen_7_8 = bank.loans.count_in_range(symbol, 700, 899)
    million_yen_9_10 = bank.loans.count_in_range(symbol, 900, 1999)
    more_than_20_million_yen = bank.loans.count_in_range(symbol, 2000, 9999)
    result = [["300万円未満", less_than_3_million_yen],["300~400万円代", million_yen_3_4],["500~600万円代", million_yen_5_6],["700~800万円代", million_yen_7_8],["900~1000万円代", million_yen_9_10],["2000万円以上", more_than_20_million_yen]]
  end

  def aggregate_loan_family_form(bank)
    couple = bank.loans.where(family_form: "couple").count
    single = bank.loans.where(family_form: "single").count
    family = bank.loans.where(family_form: "family").count
    result = [["夫婦", couple],["単身", single],["ファミリー", family]]
  end

  def aggregate_loan_job_period(bank)
    less1year = bank.loans.where(job_period: "less1year").count
    to2year = bank.loans.where(job_period: "to2year").count
    more3year = bank.loans.where(job_period: "more3year").count
    result = [["1年未満", less1year],["1~2年", to2year],["3年以上", more3year]]
  end

end

