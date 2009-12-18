class CompaniesController < ApplicationController

  def index  	  
  	if params[:location] && params[:location].size == 3
			@companies = Company.find_by_country(params[:location])
			@companies.size == 0 ? flash[:error] = "No se encontraron compañías en ese país" : @companies
	  elsif params[:location] && params[:location].size == 2
			@companies = Company.find_by_state(params[:location])
			@companies.size == 0 ? flash[:error] = "No se encontraron compañías en ese estado" : @companies
	  else
	  	@companies = Company.find(:all)
	  end
  end
  
  def show
    @company = Company.find(params[:id])
  end
  
  def new
    @company = User.find(session[:user_id]).companies.build || @Company.new
  end
  
  def create
  	@user = User.find(session[:user_id])
  	@company = @user.companies.build(params[:company])
		success = @company && @company.save
    if success && @company.errors.empty?
      flash[:notice] = "Los datos de la compañía se guardaron correctamente"
      session[:user_id] = nil
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
      flash[:notice] = "Successfully updated company."
      redirect_to @company
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "Successfully destroyed company."
    redirect_to companies_url
  end
  
  def search
  	@searchlogic = Company.searchlogic(params[:search])
  	@companies = @searchlogic.all
  end
  
end
