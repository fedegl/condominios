class Company < ActiveRecord::Base
	has_and_belongs_to_many :complex_types
	belongs_to							:user
	belongs_to							:country
	belongs_to							:state
	has_many								:experiences, :dependent => :destroy
	has_many								:tools,       :dependent => :destroy
	
	validates_presence_of		:name
	validates_presence_of		:description
	validates_presence_of		:price
	validates_presence_of		:complex_type_ids
	validates_presence_of		:phone
	validates_uniqueness_of :phone
	validates_presence_of		:country_id
	validates_presence_of		:city
	
	named_scope :find_by_country, lambda { |location| {:joins => :country, :conditions => { :countries => {:short => location} } } }
	named_scope :find_by_state, lambda { |location| {:joins => :state, :conditions => { :states => {:short2 => location} } } }

	attr_accessible :name, :price, :description, :complex_type_ids, :phone, :country_id, :state_id, :city
	
	def phone=(string)
	  clean_phone =  string
	  write_attribute(:phone, clean_phone)
	end
	
end
