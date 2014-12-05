class ToolsController < ApplicationController

  def index
    @tool = Tool.new
    @tools = []
    used = []
    touhlz = Tool.all
    touhlz.each do |f|
      if f.availability == true
        @tools << f
      else
        used << f
      end
    end
    (@tools << used).flatten!
    # @tools = Tool.all.sort_tools
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tools_path
    else
      render 'index'
    end
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.availability
      @tool.checkout(tool_params[:person_id])
    else
      @tool.put_back
    end
    @tool.save
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :img, :person_id, :availability)
  end

end
