require 'faker'

class GuestsController < ApplicationController
  def index
  end

  def add
    @event = Event.find(params[:event])
    guests = params[:guests]
    guests.each do |guest|

      g = Guest.find_or_initialize_by(email: guest['email'], event_id: @event.id)
      g.name = guest['name']

      if g.new_record?
        g.access_hash = Faker::Lorem.characters(30)
      end
      g.save
    end
    #binding.pry
    render partial: 'events/guests_list'
  end

  def validate
    binding.pry
    @guest = Guest.find_by(access_hash: params[:hash])
    if @guest
      @event = @guest.event
      redirect_to event_path @event

    else
    end

  end

  def send_invitations
    @event = Event.find(params[:id])
    @event.guests.where("not notified").each do |guest|
      GuestMailer.invite(guest).deliver_now
      guest.notified = true
      guest.save
    end
  end

  def edit
  end

  def new
    @event = Event.find(params[:id])
    @Section = Section.new
  end

  def create
  end

  def show
  end
end
