class RateList

  # クラスの初期化メソッド
  def initialize(banks)
    @banks = banks
  end

  # favoriteページの最安金利をお気に入りした銀行ごとに表示するためのメソッド
  def make_min_rate_list
    min_rate_list = {}
    @banks.each do |bank|
      min_rate_list[bank.id] = min_loan_rate(bank)
    end
    min_rate_list
  end

  def min_loan_rate(bank)
    bank.loans.pluck("min(loans.rate)")
  end

  # favoriteページの平均金利をお気に入りした銀行ごとに表示するためのメソッド
  def make_average_rate_list
    average_rate_list = {}
    @banks.each do |bank|
      average_rate_list[bank.id] = average_loan_rate(bank)
    end
    average_rate_list
  end

  def average_loan_rate(bank)
    bank.loans.pluck("avg(loans.rate)")
  end

end