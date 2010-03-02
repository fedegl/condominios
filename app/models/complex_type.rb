class ComplexType < ActiveRecord::Base
	has_many :complex_offers
	has_many :companies, :through => :complex_offers
end
