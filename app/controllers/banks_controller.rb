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
    @min_rate = Loan.joins(:bank).group(:bank_id).order("rate ASC").pluck("min(loans.rate)") # 最安金利
    #@average_rate = Loan.joins(:bank).search(@search_params).group(:bank_id).pluck("average(loans.rate)")

    # チャート表記用のデータを整形
    @loan = @bank.loans

    @rate = @loan.pluck(:rate)
    @aggregate_rate = aggregateRate(@rate)

    @age = @loan.pluck(:age)
    @aggregate_age = aggregateAge(@age)

    @income = @loan.pluck(:income)
    @aggregate_income = aggregateIncome(@income)

    @family_form = @loan.pluck(:family_form)
    @aggregate_family_form = aggregateFamilyForm(@family_form)

    @job_period = @loan.pluck(:job_period)
    @aggregate_job_period = aggregateJobPeriod(@job_period)

  end

  # 金利の棒グラフの集計範囲とラベル名を定義
  def aggregateRate(array)
    result = [["0.4%未満",0],["0.4%台",0],["0.5%台",0],["0.6%台",0],["0.7%台",0],["0.8%台",0],["0.9%台",0],["1%台",0],["2%以上",0]]
    array.each do |i|
      if i < 0.4
        result[0][1] += 1
      elsif 0.4 <= i && i < 0.5
        result[1][1] += 1
      elsif 0.5 <= i && i < 0.6
        result[2][1] += 1
      elsif 0.6 <= i && i < 0.7
        result[3][1] += 1
      elsif 0.7 <= i && i < 0.8
        result[4][1] += 1
      elsif 0.8 <= i && i < 0.9
        result[5][1] += 1
      elsif 0.9 <= i && i < 1
        result[6][1] += 1
      elsif 1 <= i && i < 2
        result[7][1] += 1
      else
        result[8][1] += 1
      end
    end
    return result
  end

  # 円グラフの集計の範囲とラベル名を定義
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

  def aggregateIncome(array)
    result = [["300万円未満",0],["300~400万円代",0],["500~600万円代",0],["700~800万円代",0],["900~1000万円代",0],["1000万円以上",0]]
    array.each do |i|
      if i < 300
        result[0][1] += 1
      elsif 300 <= i && i < 500
        result[1][1] += 1
      elsif 500 <= i && i < 700
        result[2][1] += 1
      elsif 700 <= i && i < 900
        result[3][1] += 1
      elsif 900 <= i && i < 2000
        result[4][1] += 1
      else
        result[5][1] += 1
      end
    end
    return result
  end

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