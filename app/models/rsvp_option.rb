class RsvpOption < ActiveRecord::Base
  belongs_to :event
  has_many :rsvp_option_values
  accepts_nested_attributes_for :rsvp_option_values, allow_destroy: true
end
