class FavoritesController < ApplicationController

	def create
		bank = Bank.find(params[:bank_id])
		favorite = current_user.favorites.new(bank_id: params[:bank_id])
		favorite.save!
		redirect_to bank_path(bank)
	end

	def destroy
		bank = Bank.find(params[:bank_id])
		current_user.favorites.find_by(bank_id: params[:bank_id]).destroy!
		redirect_to bank_path(bank)
	end

end
