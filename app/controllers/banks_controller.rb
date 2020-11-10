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
    @min_rate = @loan.pluck("min(loans.rate)") # 最安金利
    @average_rate = @loan.order("rate").pluck("avg(loans.rate)") # 平均金利
    @search_params = loan_search_params

    # チャート表記用のデータを整形
    @loan = @bank.loans

    @rate = @loan.pluck(:rate)
    @aggregate_rate = aggregate_rate(@bank)

    @age = @loan.pluck(:age)
    @aggregate_age = aggregateAge(@age)

    @income = @loan.pluck(:income)
    @aggregate_income = aggregate_income(@income)

    @family_form = @loan.pluck(:family_form)
    @aggregate_family_form = aggregateFamilyForm(@family_form)

    @job_period = @loan.pluck(:job_period)
    @aggregate_job_period = aggregateJobPeriod(@job_period)

  end

  def favorites
    @banks = current_user.fav_banks
    @loans = Loan.joins(:bank).where(bank_id: @banks.ids)

      @min_rate = @loans.pluck("min(loans.rate)") # 最安金利
      @average_rate = @loans.order("rate").pluck("avg(loans.rate)") # 平均金利

      # チャート表記用のデータを整形
      @aggregate_rate_list = aggregate_rate_list(@banks)
      @aggregate_income_list = aggregate_income_list(@banks)

      @age = @loans.pluck(:age)
      @aggregate_age = aggregateAge(@age)

      # @income = @loans.pluck(:income)
      # @aggregate_income = aggregateIncome(@income)

      @family_form = @loans.pluck(:family_form)
      @aggregate_family_form = aggregateFamilyForm(@family_form)

      @job_period = @loans.pluck(:job_period)
      @aggregate_job_period = aggregateJobPeriod(@job_period)
  end

  # 金利の棒グラフの集計範囲とラベル名を定義
  def aggregate_rate(bank)
    count_list(bank, :rate)
  end

  def aggregate_rate_list(banks)
    aggregate_rate_list = {}
    banks.each do |bank|
      aggregate_rate_list[bank.id] = count_list(bank, :rate)
    end
    aggregate_rate_list
  end

  def count_list(bank, symbol)
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

  # 年収の円グラフの集計の範囲とラベル名を定義
  def aggregate_income(bank)
    count_list(bank, :income)
  end

  def aggregate_income_list(banks)
    aggregate_income_list = {}
    banks.each do |bank|
      aggregate_income_list[bank.id] = count_list(bank, :income)
    end
    aggregate_income_list
  end

  def count_list(bank, symbol)
    less_than_300_ten_thousand_yen = bank.loans.count_in_range(symbol, 0, 299)
    ten_thousand_yen_300_400 = bank.loans.count_in_range(symbol, 300, 499)
    ten_thousand_yen_500_600 = bank.loans.count_in_range(symbol, 500, 699)
    ten_thousand_yen_700_800 = bank.loans.count_in_range(symbol, 700, 899)
    ten_thousand_yen_900_1000 = bank.loans.count_in_range(symbol, 900, 1999)
    more_than_2000_ten_thousand_yen = bank.loans.count_in_range(symbol, 2000, 9999)
    result = [["300万円未満",less_than_300_ten_thousand_yen],["300~400万円代",ten_thousand_yen_300_400],["500~600万円代",ten_thousand_yen_500_600],["700~800万円代",ten_thousand_yen_700_800],["900~1000万円代",ten_thousand_yen_900_1000],["2000万円以上",more_than_2000_ten_thousand_yen]]
  end

  # 年収の円グラフの集計の範囲とラベル名を定義
  # def aggregateIncome(array)
  #   result = [["300万円未満",0],["300~400万円代",0],["500~600万円代",0],["700~800万円代",0],["900~1000万円代",0],["1000万円以上",0]]
  #   array.each do |i|
  #     if i < 300
  #       result[0][1] += 1
  #     elsif 300 <= i && i < 500
  #       result[1][1] += 1
  #     elsif 500 <= i && i < 700
  #       result[2][1] += 1
  #     elsif 700 <= i && i < 900
  #       result[3][1] += 1
  #     elsif 900 <= i && i < 2000
  #       result[4][1] += 1
  #     else
  #       result[5][1] += 1
  #     end
  #   end
  #   return result
  # end

  # 年齢の円グラフの集計の範囲とラベル名を定義
  def aggregateAge(array)
    result = [["20代",0],["30代",0],["40代",0],["50代",0],["60代",0],["その他",0]]
    array.each do |i|
      if 20 <= i && i < 30
        result[0][1] += 1
      elsif 30 <= i && i < 40
        result[1][1] += 1
      elsif 40 <= i && i < 50
        result[2][1] += 1
      elsif 50 <= i && i < 60
        result[3][1] += 1
      elsif 60 <= i && i < 70
        result[4][1] += 1
      else
        result[5][1] += 1
      end
    end
    return result
  end

  # 家族構成の円グラフのラベル名を定義
  def aggregateFamilyForm(array)
    result = [["夫婦",0],["単身",0],["ファミリー",0]]
    array.each do |i|
      if i == "couple"
        result[0][1] += 1
      elsif i == "single"
        result[1][1] += 1
      else
        result[2][1] += 1
      end
    end
    return result
  end
  # 勤続年数の円グラフのラベル名を定義
  def aggregateJobPeriod(array)
    result = [["1年未満",0],["1~2年",0],["3年以上",0]]
    array.each do |i|
      if i == "less1year"
        result[0][1] += 1
      elsif i == "to2year"
        result[1][1] += 1
      else
        result[2][1] += 1
      end
    end
    return result
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