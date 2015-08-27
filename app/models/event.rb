class Event < ActiveRecord::Base
  belongs_to :user
  has_many :sections
  has_many :guests
  has_many :rsvp_options
end
