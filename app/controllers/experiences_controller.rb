class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end
  
  def show
    @experience = Experience.find(params[:id])
  end
  
  def new
  	@experience = Company.find(params[:company_id]).experiences.build
  	session[:company_id] = params[:company_id]
#    @experience = Experience.new
  end
  
  def create
  	@company = Company.find(session[:company_id])
  	@experience = @company.experiences.build(params[:experience])
#    @experience = Experience.new(params[:experience])
    if @experience.save
      flash[:notice] = "Successfully created experience."
      session[:company_id] = nil
      redirect_to @experience
    else
      render :action => 'new'
    end
  end
  
  def edit
    @experience = Experience.find(params[:id])
  end
  
  def update
    @experience = Experience.find(params[:id])
    if @experience.update_attributes(params[:experience])
      flash[:notice] = "Successfully updated experience."
      redirect_to @experience
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    flash[:notice] = "Successfully destroyed experience."
    redirect_to experiences_url
  end
end
