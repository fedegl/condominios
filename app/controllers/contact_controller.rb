class ContactController < ApplicationController

	def index		
	end
	
	def create
		if UserMailer.deliver_contact(params[:contact])
		  flash[:notice] = "Email was successfully sent."
		  redirect_to(contact_path)
		else
		  flash.now[:error] = "An error occurred while sending this email."
		  render :index
  	end
	end

end
