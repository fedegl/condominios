class Tool < ActiveRecord::Base
  has_many :tool_offers
	has_many :companies, :through => :tool_offers	
	
end
