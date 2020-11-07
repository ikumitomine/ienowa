class FavoritesController < ApplicationController

	def create
		@bank = Bank.find(params[:bank_id])
		favorite = current_user.favorites.new(bank_id: params[:bank_id])
		favorite.save
	end

	def destroy
		@bank = Bank.find(params[:bank_id])
		favorite = Favorite.find_by(bank_id: params[:bank_id], user_id: current_user.id)
		favorite.destroy
	end

end