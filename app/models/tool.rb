class Tool < ActiveRecord::Base
	belongs_to :company
	
	validates_presence_of :name, :message => "^Debes escribir un Nombre"
	validates_presence_of :description, :message => "^Debes escribir una Descripción"
end
