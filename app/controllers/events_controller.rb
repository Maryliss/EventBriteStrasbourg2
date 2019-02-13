class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create 
    @event = Event.new('title' => params[:title],'description' => params[:description],
    'start_date' => params[:start_date], 
    'duration' => params[:duration],
    'price' => params[:price],
    'location' => params[:location],
    'admin_id' => current_user.id)
 

    if @event.save
      flash[:success] = "Event créé avec succès!"
      redirect_to events_path(@event.id)
    else
      flash[:notice] = "Event non créé!"
      render "new"
      flash.delete(:notice)
    end

  end

  def edit 
    @event = Event.find(params[:id])
  end

  def update 
    @event = Event.find(params[:id])

    if @event.update('title' => params[:title],
      'description' => params[:descritpion], 
      'duration' => params[:duration],
      'price' => params[:price],
      'location' => params[:location])
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy 
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

end
