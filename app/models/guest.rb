class Guest < ActiveRecord::Base
  belongs_to :event
  #accepts_nested_attributes_for :rsvp_options

end
