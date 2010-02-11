class ToolsController < ApplicationController

  before_filter :find_company, :except => :index
  before_filter :login_required
	before_filter :authorized?

  def index
    @tools = Tool.all
  end
  
  def show
    @tool = @company.tools.find(params[:id])   
  end  
  
  def new
    @tool = @company.tools.build
  end
  
  def create
   	@tool = @company.tools.build(params[:tool])
    if @tool.save
      flash[:notice] = "El servicio se ha agregado correctamente"
      redirect_to @company
    else
      render :action => 'new'
    end
  end
  
  def edit
    @tool = @company.tools.find(params[:id])
  end
  
  def update
  	@tool = @company.tools.find(params[:id])
    if @tool.update_attributes(params[:tool])
      flash[:notice] = "El elemento se actualizó correctamente."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
  	@tool = Tool.find(params[:id])
    @tool.destroy
    flash[:notice] = "El servicio se eliminó correctamente."
    redirect_to :back
  end
  
  def find_company
    @company = Company.find(params[:company_id])
  end
 
end
