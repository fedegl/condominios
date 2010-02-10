class ComplexOffer < ActiveRecord::Base
	belongs_to :company
	belongs_to :complex_type
end
