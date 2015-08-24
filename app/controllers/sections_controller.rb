class SectionsController < ApplicationController


  def index
  end

  def new
    @event = Event.find(params[:event_id])
    @section = Section.new
  end


 def create
    binding.pry
     @event = Event.find_by(params[:event_id])
     @section = @event.sections.create(section_params)
     if @section.save
       render :partial 'events/sections'
     else
       render :partial 'events/error'
     end
end

  def sort
    #binding.pry
    params[:sort_order].each do |key,value|
      Section.find(value[:id]).update_attribute(:sort_order,value[:position])
    end
    render :nothing => true
  end

  private
    def section_params
         params.require(:section).permit(:title, :content)
    end
end
