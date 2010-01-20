class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  def index
  	@users = User.find(:all)
  end

  # render new.rhtml
  def new
    @user = User.new
  end
  
  def show
  	respond_to do |type|
      type.html
      type.json {render :json => @experience}
    end
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      flash[:notice] = "Los datos de usuario se guardaron correctamente."
      redirect_to new_user_company_path(@user.id)
    else
      flash[:error]  = "Ocurrió un error con el registro de la cuenta, por favor intenta de nuevo"
      render :action => 'new'
    end
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
