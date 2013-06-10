class Venue < ActiveRecord::Base
  attr_accessible :address, :foursquare_id, :name

  has_many :people
end
