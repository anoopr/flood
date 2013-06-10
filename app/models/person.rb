class Person < ActiveRecord::Base
  attr_accessible :phone_number, :selected_venue_id, :venue_id

  has_many :closest_venues, :dependent => :delete_all, :order => 'position ASC'
  belongs_to :venue

  def restart
    self.closest_venues.clear
    self.selected_venue_id = nil
    self.venue = nil
    self.save!
  end

end
