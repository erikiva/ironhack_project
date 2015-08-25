class RsvpOption < ActiveRecord::Base
  has_many :rsvp_option_values
  accepts_nested_attributes_for :rsvp_option_values
end
