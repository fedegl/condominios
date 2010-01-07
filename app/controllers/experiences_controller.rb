class ExperiencesController < ApplicationController
  
  before_filter :find_company, :except => :index
  before_filter :login_required
	before_filter :authorized?
  def index
    @experiences = Experience.all
  end
  
  def show
    @experience = @company.experiences.find(params[:id])
  end
  
  def new
  	@experience = @company.experiences.build
  end
  
  def create
  	@experience = @company.experiences.build(params[:experience])
    if @experience.save
      flash[:notice] = "Se agregó la experiencia correctamente."
      redirect_to @experience
    else
      render :action => 'new'
    end
  end
  
  def edit
    @experience = @company.experiences.find(params[:id])
  end
  
  def update
    @experience = @company.experiences.find(params[:id])
    if @experience.update_attributes(params[:experience])
      flash[:notice] = "El elemento se actualizó correctamente."
      redirect_to @experience
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    flash[:notice] = "Successfully destroyed experience."
    redirect_to company_path
  end
  
  def find_company
    @company = Company.find(params[:company_id])
  end
  
  protected
  
  def authorized?
  	find_company
		if current_user.id == @company.user_id
			true
		else
			flash[:error] = "Ocurrió un error al intentar realizar esa acción"
			redirect_to root_path
		end		
  end
end
