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

  def process_guests guests

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
