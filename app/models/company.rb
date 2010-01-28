class Company < ActiveRecord::Base
	has_and_belongs_to_many :complex_types
	belongs_to							:user
	belongs_to							:country
	belongs_to							:state
	has_many								:experiences, :dependent => :destroy
	has_many								:tools,       :dependent => :destroy
	
	has_attached_file :logo, :styles => { :small => "150x100>" },
										:default_url => "/images/missing.png",
                  	:url  => "/assets/companies/:id/:style/:basename.:extension",
                  	:path => ":rails_root/public/assets/companies/:id/:style/:basename.:extension"

	#validates_attachment_size :logo, :less_than => 1.megabytes, :message => "^La imagen que seleccionaste es demasiado grande. Debe ser menor a 1 MB.", :allow_blank => true
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
	
	named_scope :find_by_country_short, lambda { |location| {:joins => :country, :conditions => { :countries => {:short => location} } } }
	named_scope :find_by_state_short2, lambda { |location| {:joins => :state, :conditions => { :states => {:short2 => location} } } }

	attr_accessible :name, :price, :description, :complex_type_ids, :phone, :country_id, :state_id, :city, :logo
	
	def phone=(string)
	  clean_phone =  string
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
