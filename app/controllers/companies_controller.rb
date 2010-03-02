class CompaniesController < ApplicationController

	before_filter :login_required, :only => [:edit, :update]
	before_filter :authorized?, :only => [:edit, :update]

  def index
  #REFACTOR! - Named Scope?
  	if params[:company] && !params[:location].blank?
  		@companies = Company.activated.search_location(params[:location]).search(params[:company]).paginate :page => params[:page], :per_page => 10
  	elsif !params[:company] && !params[:location].blank?
  		@companies = Company.activated.search_location(params[:location]).paginate :page => params[:page], :per_page => 10
  	elsif params[:company] && params[:location].blank?
  		@companies = Company.activated.search(params[:company]).paginate :page => params[:page], :per_page => 10
  	else  		
  		@companies = Company.activated.paginate :page => params[:page], :per_page => 10
  	end  	
  	  
  	if @companies.empty?
  		flash[:error] = "Por el momento no contamos con ninguna compañía registrada con esas caracteristicas. Si conoces alguna inv&iacute;tala a registrarse con nosotros"
  		redirect_to root_path
  	end
  end
  
  def show
    @company = Company.find(params[:id])    
  end
  
  def new   
    @company = Company.new
    @user = @company.users.build
    3.times { @company.softwares.build }
  end
  
  def create  	
  	@company = Company.new(params[:company])
    if @company.save
      flash[:notice] = "Tus datos se guardaron correctamente"
      redirect_to success_path
    else
      3.times { @company.softwares.build }
      render :action => 'new'
    end
  end
  
  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      flash[:notice] = "La información de la compañía se actualizó correctamente."
      redirect_to @company
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "La compañía se eliminó correctamente."
    redirect_to(:back)
  end
  
  def search
  	@companies = Company.searchlogic(params[:search])  	
  end 
  
  protected
  
  def authorized?
		@company = Company.find(params[:id])
		if @company.users.find(current_user.id)
			true
		else
			flash[:error] = "Ocurrió un error al intentar realizar esa acción"
			redirect_to root_path
		end		
	end	
  
end
