class EventsController < ApplicationController
  
  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @event = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      # Handle a succesful save
      flash[:success] = 'Welcome...'
      redirect_to event_path(@event)
    else
      # Errors in the form. Correct them.
      render 'new'
    end
  end
end
