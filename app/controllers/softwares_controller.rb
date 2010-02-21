class SoftwaresController < ApplicationController

	before_filter :find_company, :except => :index
  before_filter :login_required
	before_filter :authorized?

  def index
    @softwares = Software.all
  end
  
  def show
    @software = @company.softwares.find(params[:id])
  end  
  
  def new
    @software = @company.softwares.build
  end
  
  def create
   	@software = @company.softwares.build(params[:software])
    if @software.save
      flash[:notice] = "El software se ha agregado correctamente"
      redirect_to @company
    else
      render :action => 'new'
    end
  end
  
  def edit
    @software = @company.softwares.find(params[:id])
  end
  
  def update
  	@software = @company.softwares.find(params[:id])
    if @software.update_attributes(params[:software])
      flash[:notice] = "El software se actualizó correctamente."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
  	@software = Software.find(params[:id])
    @software.destroy
    flash[:notice] = "El software se eliminó correctamente."
    redirect_to :back
  end
  
  def find_company
    @company = Company.find(params[:company_id])
  end

end
