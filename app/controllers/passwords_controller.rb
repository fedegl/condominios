class PasswordsController < ApplicationController

	before_filter :login_from_cookie
  before_filter :login_required, :except => [:create]

  # Don't write passwords as plain text to the log files
  filter_parameter_logging :old_password, :password, :password_confirmation

  # GETs should be safe
  verify :method => :post, :only => [:create], :redirect_to => { :controller => :site }
  verify :method => :put, :only => [:update], :redirect_to => { :controller => :site }

  # POST /passwords
  # Forgot password
  def create
    respond_to do |format|
      if user = User.find(:first, :conditions => {:email => params[:email]})
        @new_password = random_password
        user.password = user.password_confirmation = @new_password
        user.save_without_validation
        UserMailer.deliver_new_password(user, @new_password)

        format.html {
          flash[:notice] = "Una nueva contraseña se ha enviado a #{params[:email]}"
          redirect_to root_path
        }
      else
        flash[:error] =  "No pudimos encontrar ninguna cuenta relacionada a ese correo electrónico"
        format.html { render :action => "new" }
      end
    end
  end

  # GET /users/1/password/edit
  # Changing password
  def edit
    @user = current_user
  end

  # PUT /users/1/password
  # Changing password
  def update
    @user = current_user
    old_password = params[:old_password]
    @user.attributes = params[:user]

    respond_to do |format|
      if @user.authenticated?(old_password) && @user.save
      	flash[:notice] = "La contraseña se actualizó correctamente"
        format.html { redirect_to user_path(@user) }        
      else
      	flash[:error] = "Ocurrió un error al tratar de actualizar la contraseña"
        format.html { render :action => 'edit' }
      end
    end
  end

  protected

  def random_password( len = 20 )
    chars = (("a".."z").to_a + ("1".."9").to_a )- %w(i o 0 1 l 0)
    newpass = Array.new(len, '').collect{chars[rand(chars.size)]}.join
  end

end
