class Company < ActiveRecord::Base
	has_many								:complex_offers
	has_many								:tool_offers
	has_many								:complex_types, :through => :complex_offers
	has_many								:users
	belongs_to							:country
	belongs_to							:state
	has_many								:experiences, :dependent => :destroy
	has_many								:tools, :through => :tool_offers, :dependent => :destroy
	accepts_nested_attributes_for :users
	accepts_nested_attributes_for :tools, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

	production = ENV['RAILS_ENV'] == 'production'

	has_attached_file :logo, :styles => { :small => "150x100>" },
										:default_url => "/images/missing.png",
										:storage => (production ? :s3 : :filesystem),
										:bucket => 'condominios',
										:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",										
                  	:url  => "/system/companies/:id/:style/:basename.:extension",
                  	:path => ":rails_root/public/system/companies/:id/:style/:basename.:extension"

	validates_attachment_size :logo, :less_than => 1.megabytes, :message => "^La imagen que seleccionaste es demasiado grande. Debe ser menor a 1 MB.", :unless => Proc.new {|company| company.logo }
	validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'], :allow_blank => true
	
	validates_presence_of		:name, :message => "^Debes escribir el Nombre de tu compañía"
	validates_presence_of		:description, :message => "^Debes escribir una Descripción para tu compañía"
	validates_presence_of		:price, :message => "^Debes escribir un Precio"
	validates_presence_of		:complex_type_ids, :message => "^Debes seleccionar el Tipo de complejo que administras"
	validates_presence_of		:phone, :message => "^Debes escribir un Número de teléfono"
	validates_uniqueness_of :phone, :message => "^Ese número de teléfono ya existe"
	validates_presence_of		:country_id, :message => "^Debes especificar un País"
	validates_presence_of		:state_id, :message => "^Debes especificar un Estado", :if => :country_is_mexico?
	validates_presence_of		:city, :message => "^Debes escribir una Ciudad"	
	
	named_scope :activated, :include => :users, :conditions => { 'users.activation_code' => nil }
	named_scope :search_location, lambda { |location| {:include => [:country, :state], :conditions =>  ['countries.short = ? OR states.short2 = ?', location, location] }}
	attr_accessible :name, :price, :description, :complex_type_ids, :tools_attributes, :users_attributes, :phone, :country_id, :state_id, :city, :logo, 
								:security, :gardening, :cleaning, :money_collect, :personnel, :procedures, :providers, :finance, :maintenance
	
	def phone=(string)
	  clean_phone = string
	  write_attribute(:phone, clean_phone)
	end
	
	def state_id=(id)
	  id = self.country_id == 15 ? id : nil
	  write_attribute(:state_id, id)
	end
	
	def country_is_mexico?
	  self.country_id == 15
	end
	
end
