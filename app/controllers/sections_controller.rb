class SectionsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @section = Section.new
  end

  def create
    #binding.pry
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section.post, notice: 'Section was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @section}
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @event = Event.find(params[:event_id])
    @section.update_attributes(section_params)
    respond_to do |format|
    format.js
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
         params.require(:section).permit(:title, :content, :event_id)
    end
end
