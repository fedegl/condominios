class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Por favor activa tu cuenta'  
    @body[:url]  = "http://#{domain}/activate/#{user.activation_code}"  
  end
  
  def activation(user)
    setup_contact_email(user)
    @subject    += '¡Tu cuenta ha sido activada!'
    @body[:url]  = "http://#{domain}/"
    @body[:email] = user.email
  end
  
  def contact(email_params)
  	setup_contact_email(email_params)
  end
  
  def new_password(user, new_password)
		setup_email(user)
		@subject    += 'Tu nueva contraseña'
		@body[:new_password] = new_password
	end
  
  protected  
  
    def domain
      if ENV['RAILS_ENV'] == "production"
        "condominios.heroku.com"
      elsif ENV['RAILS_ENV'] == "staging"
        "condominios.heroku.com"
      else
        "administraciondecondominios.local"
      end
    end
  
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "soporte@condominios.com"
      @subject     = "AdministraciondeCondominios.com - "
      @sent_on     = Time.now
      @body[:user] = user
    end
    
    def setup_contact_email(email_params)
      @recipients  = "rene@innku.com"
      @from        = "contact-us@condominios.com"
      @subject     = "AdministraciondeCondominios.com - Contáctanos"
      @sent_on     = Time.now
      @body[:message] = "#{email_params[:message]}"
      @body[:name] = "#{email_params[:name]}"
      @body[:email] = "#{email_params[:email]}"
    end
end
