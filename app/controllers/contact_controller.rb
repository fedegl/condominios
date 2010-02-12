class ContactController < ApplicationController

	def index		
	end
	
	def create
		if UserMailer.deliver_contact(params[:contact])
		  flash[:notice] = "El correo electrónico se envió correctamente. Nos pondremos en contacto contigo lo más pronto posible"
		  redirect_to(contact_path)
		else
		  flash.now[:error] = "Ocurrió un error al tratar de enviar el correo electrónico. Intenta de nuevo"
		  render :index
  	end
	end

end
