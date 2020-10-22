class AttributeBank < ApplicationRecord
	belongs_to :attribute_post
	belongs_to :bank_post
end
