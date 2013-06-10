class ClosestVenue < ActiveRecord::Base
  attr_accessible :person_id, :position, :venue_id

  belongs_to :person
  belongs_to :venue
end
