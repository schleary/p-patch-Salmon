class EventsController < ApplicationController

  def new
    @event = Event.new()
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to calendar_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
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
    @event.Event.find(params[:id])
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:description, :name, :day, :end_time, :start_time)
  end

end
