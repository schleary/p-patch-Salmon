class EventsController < ApplicationController

  def index
    puts"1"
    update
  end

  def new
    puts"2"
    @event = Event.new()
  end

  def create
    puts"3"
    @event = Event.new(event_params)
    if @event.save
      redirect_to calendar_path
    else
      render 'new'
    end
  end

  def show
    puts"4"
    @event = Event.find(params[:id])
  end

  def edit
    puts"5"
    @event = Event.find(params[:id])
  end

  def update
    puts"6"
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.save
      flash[:notice] = "You have successfully updated your event!"
      redirect_to calendar_path
    else
      render 'update'
    end
  end

  def destroy
    puts"7"
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to calendar_path
  end

  private

  def event_params
    puts"8"
    params.require(:event).permit(:description, :name, :day, :end_time, :start_time)
  end

end
