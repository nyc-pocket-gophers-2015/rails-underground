class EventsController < ApplicationController
  before_action :require_current_user

  def index
    @events = current_user.events.future
  end

  def new
    @event = Event.new
  end

  def create 
    event = Event.new(event_params)
    people_names = params[:person]

    people_names.each do |person|
      guest = User.find_by(email: person[:email])
      event.guests << guest if guest
    end

    if event.save
      redirect_to root_path
    else
      render :new
      flash[:warn] = "No"
    end
    
  end

  private
  def event_params
    params.require(:event).permit(:name, :min_age, :held_at).merge(organizer: current_user)
  end
end