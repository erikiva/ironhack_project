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
    render 'main'
  end

  def show
  end
end
