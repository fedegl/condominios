class Software < ActiveRecord::Base
	has_many :software_offers
	has_many :companies, :through => :software_offers	
end
