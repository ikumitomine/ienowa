class Loan < ApplicationRecord
	belongs_to :user
	belongs_to :bank

  	# 性別
	enum sex: { male: 0, female: 1 }
	# 家族形態
	enum family_form: { couple: 0, single: 1, family: 2 }
	# 雇用形態
	enum employment_status: { regular: 0, non: 1 }
	# 勤続年数
	enum job_period: { less1year: 0, to2year: 1, more3year: 2 }
	# 上場
	enum listed: { listed: 0, unlisted: 1 }
	# 金利タイプ
	enum rate_type: { fluctuation: 0, fixed: 1 }
	# 借入形態
	enum borrowing_form: { alone: 0, pair: 1 }
	# 購入地
	enum bought_place: {
     '---': 0,
     hokkaido: 1, aomori: 2, iwate: 3, miyagi: 4, akita: 5, yamagata: 6, fukushima: 7,
     ibaraki: 8, tochigi: 9, gunma: 10, saitama: 11, chiba: 12, tokyo: 13, kanagawa: 14,
     niigata: 15, toyama: 16, ishikawa: 17, fukui: 18, yamanashi: 19, nagano: 20,
     gifu: 21, shizuoka: 22, aichi: 23, mie: 24,
     shiga: 25, kyoto: 26, osaka: 27, hyogo: 28, nara: 29, wakayama: 30,
     tottori: 31, shimane: 32, okayama: 33, hiroshima: 34, yamaguchi: 35,
     tokushima: 36, kagawa: 37, ehime: 38, kochi: 39,
     fukuoka: 40, saga: 41, nagasaki: 42, kumamoto: 43, oita: 44, miyazaki: 45, kagoshima: 46,
     okinawa:47
   	}


   	scope :search, -> (search_params) do
   		return if search_params.blank?
   		age_from(search_params[:age])
      	.age_to(search_params[:age])
   		.family_form_is(search_params[:family_form])
   		.income_from(search_params[:income])
      	.income_to(search_params[:income])
   		.employment_status_is(search_params[:employment_status])
   		.job_period_is(search_params[:job_period])
   		.bought_place_is(search_params[:bought_place])
   	end

   	scope :age_from, -> (from) { where('? <= age', from ) if from.present? }
   	scope :age_to, -> (to) { whrer('age <= ?', to) if to.present? }
   	scope :family_form_is, -> (family_form) { where(family_form: family_form) if family_form.present? }
   	scope :income_from, -> (from) { where('? <= income', from ) if from.present? }
   	scope :income_to, -> (to) { where('income <= ?', to) if to.present? }
   	scope :employment_status_is, -> (employment_status) { where(employment_status: employment_status) if employment_status.present? }
   	scope :job_period_is, -> (job_period) { where(job_period: job_period) if job_period.present? }
   	scope :bought_place_is, -> (bought_place) { where(bought_place: bought_place) if bought_place.present? }
end
