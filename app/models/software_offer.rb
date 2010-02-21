class SoftwareOffer < ActiveRecord::Base
	belongs_to :company
	belongs_to :software
end
