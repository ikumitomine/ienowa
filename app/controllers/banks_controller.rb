class BanksController < ApplicationController
  def index
  	@banks = Loan.joins(:bank).group(:bank_id).pluck("banks.id,banks.name,min(loans.rate)")
  end

  def show
  	@bank = Bank.find(params[:id])
  	#@loans = @bank.loan
  end

  def favorites
  	@banks = current_user.fav_banks.includes(:user)
  end
end