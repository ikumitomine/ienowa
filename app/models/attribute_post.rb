class AttributePost < ApplicationRecord
	belongs_to :user

	#bank_postとattribute_postを中間テーブルattribute_bankでつなぐ
  	has_many :attribute_banks
  	has_many :bank_posts, through: :attribute_banks
end
