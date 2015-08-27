class EventsController < ApplicationController
  respond_to :html, :js
  def index
  end

  def new
    @user = current_user
    @event = Event.new(user_id: @user.id)
    @event.event_date = DateTime.now
  end

  def create
    @event = Event.create(event_params)
    @user = current_user
    #binding.pry
    redirect_to '/users/profile'
  end

  def edit
    #binding.pry
    @event = Event.find(params[:id])
    @guest = Guest.new
    @section = Section.new
    @rsvp_option = RsvpOption.new
    @rsvp_option.rsvp_option_values.new
    render 'main'
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)
    redirect_to edit_event_path
  end

  def show
    @event = Event.find(params[:id])
    @rsvp_option = RsvpOption.new
    @event.rsvp_options.build
  end

  def destroy

  end
  private
    def event_params
         params.require(:event).permit(:name, :user_id, :event_date, :location, :latitude, :longitude)
    end
end
