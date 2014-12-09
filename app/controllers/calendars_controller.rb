class CalendarsController < ApplicationController

  def index
    # @calendars = Calendar.all
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to calendars_path
    else
      render :new
    end
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      redirect_to calendars_path
    else
      render :edit
    end
  end

  def show
    @calendar = Calendar.find(params[:id])
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title, :content, :img, :user_id)
  end
end
