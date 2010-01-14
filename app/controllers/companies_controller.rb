class CompaniesController < ApplicationController

	before_filter :login_required, :only => [:edit, :update]
	before_filter :authorized?, :only => [:edit, :update]

  def index  	  
  	if params[:location] && params[:location].size == 3
			@companies = Company.find_by_country_short(params[:location])
			@companies.empty? ? flash[:error] = "No se encontraron compañías en ese país" : @companies
	  elsif params[:location] && params[:location].size == 2
			@companies = Company.find_by_state_short2(params[:location])
			@companies.empty? ? flash[:error] = "No se encontraron compañías en ese estado" : @companies
	  else
	  	@companies = Company.find(:all)
	  end
  end
  
  def show
    @company = Company.find(params[:id])
    respond_to do |type|
      type.html
      type.json {render :json => @company}
    end
  end
  
  def new
    @user = User.find(params[:user_id])
    @company = Company.new
  end
  
  def create
  	@user = User.find(params[:user_id])
  	@company = @user.companies.build(params[:company])
    if @company.save
      flash[:notice] = "Los datos de la compañía se guardaron correctamente"
      redirect_to @company
    else
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
    redirect_to companies_url
  end
  
  def search
  	@searchlogic = Company.searchlogic(params[:search])
  	@companies = @searchlogic.all
  end
  
  protected
  
  def authorized?
  	@company = Company.find(params[:id])
		if current_user.id == @company.user_id
			true
		else
			flash[:error] = "Ocurrió un error al intentar realizar esa acción"
			redirect_to root_path
		end		
  end
  
end
