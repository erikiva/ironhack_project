class SectionsController < ApplicationController
  def index
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
