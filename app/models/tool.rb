class Tool < ActiveRecord::Base
	belongs_to :company
	
	validates_presence_of :name
	validates_presence_of :description
end
