class EventsController < ApplicationController

  before_filter :get_event_object, :only => [:show,:edit,:update]
  before_filter :check_logged_in, :only =>
 [:edit,:destroy,:new,:create,:update]
 before_filter :check_user, :only =>
 [:edit,:update]
 
  private
  
  def get_event_object
      @event = Event.find_by_id(params[:id])
      if @event.nil?
       flash[:notice]="Sorry unable to find the event"
       redirect_to events_path
      end
  end
  
  def check_user
    if current_user != @event.user
        flash[:error] = "Sorry, The function cannot be performed!"
     redirect_to events_path and return
    end
 end
 
  public
  
  def index
   @events = Event.all
  end

  def new
   @event = Event.new
  end

  def show
    @commentable = @event
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def edit
  end
  
  def update
    if @event.update_attributes(params[:event])
     flash[:notice]="Congrats!!! Your changes to the event has been successfully updated"
     redirect_to event_path(@event)
    else
     flash[:error]="Sorry !! Unable to save your changes"
     render :action =>:edit
    end
  end
  
  def create
    
    @event = Event.new(params[:event])
    @event.user_id = current_user.id
    if @event.save
      flash[:notice]= "You have Successfully saved the event"
      redirect_to events_path
    else
      flash[:error]= "Sorry!! Unable to save the Event"
      render :new  
    end
  end
end
