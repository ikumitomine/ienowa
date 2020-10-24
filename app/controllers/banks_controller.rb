class BanksController < ApplicationController
  def index
  	@banks = Loan.joins(:bank).group(:bank_id).pluck("banks.id,banks.name,min(loans.rate)")
  end
end