class Section < ActiveRecord::Base
  belongs_to :event
  default_scope { order("sort_order ASC") }
end
