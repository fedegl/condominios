class Experience < ActiveRecord::Base
	belongs_to :company
	
	validates_presence_of :name, :message => "^Debes escribir el Nombre del condominio"
	validates_presence_of :description, :message => "^Debes escribir una Descripción"
	validates_presence_of :start_year, :message => "^Debes especificar el año de inicio"
	validates_presence_of :end_year, :message => "^Debes especificar el año de finalización"
	
	attr_accessible :name, :description, :start_year, :end_year
end
