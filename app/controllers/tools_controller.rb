class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end
  
  def show
    @tool = Tool.find(params[:id])
  end
  
  def new
    @tool = Company.find(params[:company_id]).tools.build
  	session[:company_id] = params[:company_id]
  end
  
  def create
  	@company = Company.find(session[:company_id])
  	@tool = @company.tools.build(params[:tool])
#    @tools = Tools.new(params[:tools])
    if @tool.save
      flash[:notice] = "La herramienta o servicio se ha agregado correctamente"
      session[:company_id] = nil
      redirect_to @tool
    else
      render :action => 'new'
    end
  end
  
  def edit
    @tool = Tool.find(params[:id])
  end
  
  def update
    @tool = Tool.find(params[:id])
    if @tool.update_attributes(params[:tool])
      flash[:notice] = "Successfully updated tools."
      redirect_to @tool
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    flash[:notice] = "Successfully destroyed tools."
    redirect_to tools_url
  end
end
