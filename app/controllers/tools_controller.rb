class ToolsController < ApplicationController

  def create
    @tool = Tool.new(tool_params)
    redirect_to tools_path
  end

  def update
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :img, :availabilty, :person_id)
  end

end
