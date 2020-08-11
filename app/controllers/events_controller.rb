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

end
