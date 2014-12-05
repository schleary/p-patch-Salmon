class ToolsController < ApplicationController

  def create
    @tool = Tool.new(tool_params)
    redirect_to tools_path
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.availability
      @tool.checkout(tool_params[:user_id])
    else
      @tool.put_back
    end
    @tool.save
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:id, :name, :img, :availabilty, :user_id)
  end

end
