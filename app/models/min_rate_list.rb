class MinRateList

  def initialize(banks)
  	@banks = banks
  end

  def make
    min_rate_list = {}
    @banks.each do |bank|
      min_rate_list[bank.id] = min_loan_rate(bank)
    end
    min_rate_list
  end

  def min_loan_rate(bank)
  	bank.loans.pluck("min(loans.rate)")
  end

  # def name
  # 	puts @bank
  # end

  # def self.hello
  # 	puts 'Hello'
  # end

end