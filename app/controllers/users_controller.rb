class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  def index
  	if admin?
  		 @users = User.find(:all)  		
  	else
  		flash[:error] = "No se te permite realizar esta acción"
  		redirect_to root_path
  	end
  end

  # render new.rhtml
  def new
    @user = User.new
  end
  
  def show
  	@user = User.find(params[:id])    
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Los datos de usuario y compañía se guardaron correctamente."
      redirect_to @company
    else
      flash[:error]  = "Ocurrió un error con el registro de la cuenta, por favor intenta de nuevo"
      render :action => 'new'
    end
  end
  
  def edit
  	@user = User.find(params[:id])
  end

	def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "La información se actualizó correctamente."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "El usuario se eliminó correctamente."
    redirect_to(:back)
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Tu cuenta ha sido activada, ingresa tus datos para continuar."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end
end
