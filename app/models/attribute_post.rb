class AttributePost < ApplicationRecord
	belongs_to :user

	#bank_postとattribute_postを中間テーブルattribute_bankでつなぐ
  	has_many :attribute_banks
  	has_many :bank_posts, through: :attribute_banks

  	# 性別
	enum sex: { male: 0, female: 1 }
	# 家族形態
	enum family_form: { couple: 0, single: 1, family:2 }
	# 雇用形態
	enum employment_status: { regular: 0, non: 1 }
	# 勤続年数
	enum length_job: { less1year: 0, to2year: 1, more3year: 2 }
	# 上場
	enum listed: { listed: 0, unlisted: 1 }

end
