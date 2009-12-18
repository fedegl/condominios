class Experience < ActiveRecord::Base
	belongs_to :company
	
	validates_presence_of :name
	validates_presence_of :description
	validates_presence_of :start_year
	validates_presence_of :end_year
	
	attr_accessible :name, :description, :start_year, :end_year
end
