class ToolsController < ApplicationController

  def index
    @tool = Tool.new
    @tools = []
    used = []
    unavailable = []
    avail = []
    touhlz = Tool.all
    touhlz.each do |f|
      if f.availability == false && f.user_id == @current_user.id
        @tools << f
      elsif f.availability == true
        used << f
      elsif f.availability == false && f.user_id != @current_user.id
        avail << f
      else
        unavailable << f
      end
    end
    (@tools << used).flatten!
    (@tools << avail).flatten!
    (@tools << unavailable).flatten!
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
      @tool.checkout(@current_user.id)
    else
      @tool.put_back
    end
    @tool.save
    # json or html; can put hash here if you need it.
    # render json: []
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:id, :name, :img, :availabilty, :user_id)
  end

end
