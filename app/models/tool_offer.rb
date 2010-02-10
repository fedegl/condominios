class ToolOffer < ActiveRecord::Base
	belongs_to :company
	belongs_to :tool
end
