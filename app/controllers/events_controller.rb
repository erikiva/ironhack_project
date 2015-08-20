class EventsController < ApplicationController
  def index
  end

  def new
    @user = current_user
    @event = Event.new(@user)
  end

  def create
  end

  def edit
    @event = Event.find(params[:id])
    @guest = Guest.new
    @section = Section.new
    render 'main'
  end

  def show
  end
end
