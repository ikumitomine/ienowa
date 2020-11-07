module LoansHelper
	# confirm画面でsessionの値を日本語化するために定義
	def confirm_sex
		if session[:sex] == 'male'
			'男性'
		else
			'女性'
		end
	end

	def confirm_family_form
		if session[:family_form] == 'couple'
			'夫婦'
		elsif session[:family_form] == 'single'
			'単身'
		else
			'ファミリー'
		end
	end

	def confirm_employment_status
		if session[:employment_status] == 'regular'
			'正社員'
		else
			'非正社員'
		end
	end

	def confirm_job_period
		if session[:job_period] == 'less1year'
			'1年未満'
		elsif session[:job_period] == 'to2year'
			'1~2年'
		else
			'3年以上'
		end
	end

	def confirm_listed
		if session[:listed] == 'listed'
			'上場企業'
		else
			'非上場企業'
		end
	end

	def confirm_rate_type
		if session[:rate_type] == 'fluctuation'
			'変動金利'
		else
			'固定金利'
		end
	end

	def confirm_borrowing_form
		if session[:borrowing_form] == 'alone'
			'単独債務'
		else
			'連帯債務・ペアローン'
		end
	end

	def confirm_bought_place
		if session[:bought_place] == 'hokkaido'
			'北海道'
		elsif session[:bought_place] == 'aomori'
			'青森県'
		elsif session[:bought_place] == 'iwate'
			'岩手県'
		elsif session[:bought_place] == 'miyagi'
			'宮城県'
		elsif session[:bought_place] == 'akita'
			'秋田県'
		elsif session[:bought_place] == 'yamagata'
			'山形県'
		elsif session[:bought_place] == 'fukushima'
			'福島県'
		elsif session[:bought_place] == 'igaraki'
			'茨城県'
		elsif session[:bought_place] == 'tochigi'
			'栃木県'
		elsif session[:bought_place] == 'gunma'
			'群馬県'
		elsif session[:bought_place] == 'saitama'
			'埼玉県'
		elsif session[:bought_place] == 'chiba'
			'千葉県'
		elsif session[:bought_place] == 'tokyo'
			'東京都'
		elsif session[:bought_place] == 'kanagawa'
			'神奈川県'
		elsif session[:bought_place] == 'niigata'
			'新潟県'
		elsif session[:bought_place] == 'toyama'
			'富山県'
		elsif session[:bought_place] == 'ishikawa'
			'石川県'
		elsif session[:bought_place] == 'fukui'
			'福井県'
		elsif session[:bought_place] == 'yamanashi'
			'山梨県'
		elsif session[:bought_place] == 'nagano'
			'長野県'
		elsif session[:bought_place] == 'gifu'
			'岐阜県'
		elsif session[:bought_place] == 'shizuoka'
			'静岡県'
		elsif session[:bought_place] == 'aichi'
			'愛知県'
		elsif session[:bought_place] == 'mie'
			'三重県'
		elsif session[:bought_place] == 'shiga'
			'滋賀県'
		elsif session[:bought_place] == 'kyoto'
			'京都府'
		elsif session[:bought_place] == 'osaka'
			'大阪府'
		elsif session[:bought_place] == 'hyogo'
			'兵庫県'
		elsif session[:bought_place] == 'nara'
			'奈良県'
		elsif session[:bought_place] == 'wakayama'
			'和歌山県'
		elsif session[:bought_place] == 'tottori'
			'鳥取県'
		elsif session[:bought_place] == 'shimane'
			'島根県'
		elsif session[:bought_place] == 'okayama'
			'岡山県'
		elsif session[:bought_place] == 'hiroshima'
			'広島県'
		elsif session[:bought_place] == 'yamaguchi'
			'山口県'
		elsif session[:bought_place] == 'tokushima'
			'徳島県'
		elsif session[:bought_place] == 'kagawa'
			'香川県'
		elsif session[:bought_place] == 'ehime'
			'愛媛県'
		elsif session[:bought_place] == 'kochi'
			'高知県'
		elsif session[:bought_place] == 'fukuoka'
			'福岡県'
		elsif session[:bought_place] == 'saga'
			'佐賀県'
		elsif session[:bought_place] == 'nagasaki'
			'長崎県'
		elsif session[:bought_place] == 'kumamoto'
			'熊本県'
		elsif session[:bought_place] == 'oita'
			'大分県'
		elsif session[:bought_place] == 'miyazaki'
			'宮崎県'
		elsif session[:bought_place] == 'kagoshima'
			'鹿児島県'
		else
			'沖縄県'
		end
	end

	def search_family_form
		if @search_params[:family_form] == 'couple'
			'夫婦'
		elsif @search_params[:family_form] == 'single'
			'単身'
		else
			'ファミリー'
		end
	end

	def search_employment_status
		if @search_params[:employment_status] == 'regular'
			'正社員'
		else
			'非正社員'
		end
	end

	def search_job_period
		if @search_params[:job_period] == 'less1year'
			'1年未満'
		elsif @search_params[:job_period] == 'to2year'
			'1~2年'
		else
			'3年以上'
		end
	end
	def search_bought_place
		if @search_params[:bought_place] == 'hokkaido'
			'北海道'
		elsif @search_params[:bought_place] == 'aomori'
			'青森県'
		elsif @search_params[:bought_place] == 'iwate'
			'岩手県'
		elsif @search_params[:bought_place] == 'miyagi'
			'宮城県'
		elsif @search_params[:bought_place] == 'akita'
			'秋田県'
		elsif @search_params[:bought_place] == 'yamagata'
			'山形県'
		elsif @search_params[:bought_place] == 'fukushima'
			'福島県'
		elsif @search_params[:bought_place] == 'igaraki'
			'茨城県'
		elsif @search_params[:bought_place] == 'tochigi'
			'栃木県'
		elsif @search_params[:bought_place] == 'gunma'
			'群馬県'
		elsif @search_params[:bought_place] == 'saitama'
			'埼玉県'
		elsif @search_params[:bought_place] == 'chiba'
			'千葉県'
		elsif @search_params[:bought_place] == 'tokyo'
			'東京都'
		elsif @search_params[:bought_place] == 'kanagawa'
			'神奈川県'
		elsif @search_params[:bought_place] == 'niigata'
			'新潟県'
		elsif @search_params[:bought_place] == 'toyama'
			'富山県'
		elsif @search_params[:bought_place] == 'ishikawa'
			'石川県'
		elsif @search_params[:bought_place] == 'fukui'
			'福井県'
		elsif @search_params[:bought_place] == 'yamanashi'
			'山梨県'
		elsif @search_params[:bought_place] == 'nagano'
			'長野県'
		elsif @search_params[:bought_place] == 'gifu'
			'岐阜県'
		elsif @search_params[:bought_place] == 'shizuoka'
			'静岡県'
		elsif @search_params[:bought_place] == 'aichi'
			'愛知県'
		elsif @search_params[:bought_place] == 'mie'
			'三重県'
		elsif @search_params[:bought_place] == 'shiga'
			'滋賀県'
		elsif @search_params[:bought_place] == 'kyoto'
			'京都府'
		elsif @search_params[:bought_place] == 'osaka'
			'大阪府'
		elsif @search_params[:bought_place] == 'hyogo'
			'兵庫県'
		elsif @search_params[:bought_place] == 'nara'
			'奈良県'
		elsif @search_params[:bought_place] == 'wakayama'
			'和歌山県'
		elsif @search_params[:bought_place] == 'tottori'
			'鳥取県'
		elsif @search_params[:bought_place] == 'shimane'
			'島根県'
		elsif @search_params[:bought_place] == 'okayama'
			'岡山県'
		elsif @search_params[:bought_place] == 'hiroshima'
			'広島県'
		elsif @search_params[:bought_place] == 'yamaguchi'
			'山口県'
		elsif @search_params[:bought_place] == 'tokushima'
			'徳島県'
		elsif @search_params[:bought_place] == 'kagawa'
			'香川県'
		elsif @search_params[:bought_place] == 'ehime'
			'愛媛県'
		elsif @search_params[:bought_place] == 'kochi'
			'高知県'
		elsif @search_params[:bought_place] == 'fukuoka'
			'福岡県'
		elsif @search_params[:bought_place] == 'saga'
			'佐賀県'
		elsif @search_params[:bought_place] == 'nagasaki'
			'長崎県'
		elsif @search_params[:bought_place] == 'kumamoto'
			'熊本県'
		elsif @search_params[:bought_place] == 'oita'
			'大分県'
		elsif @search_params[:bought_place] == 'miyazaki'
			'宮崎県'
		elsif @search_params[:bought_place] == 'kagoshima'
			'鹿児島県'
		else
			'沖縄県'
		end
	end



end