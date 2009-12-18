class ExperiencesController < ApplicationController
  
  before_filter :find_company
  
  def index
    @experiences = @company.experiences
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
      flash[:notice] = "Successfully created experience."
      session[:company_id] = nil
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
      flash[:notice] = "Successfully updated experience."
      redirect_to @experience
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @experience = @company.experiences.find(params[:id])
    @experience.destroy
    flash[:notice] = "Successfully destroyed experience."
    redirect_to experiences_url
  end
  
  def find_company
    @company = Company.find(params[:company_id])
  end
end
