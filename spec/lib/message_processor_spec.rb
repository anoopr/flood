require 'spec_helper'
require 'message_processor'

describe MessageProcessor do
  include MessageProcessor

  it "handles RESTART" do
    venue = Venue.create!
    cv = ClosestVenue.create!(venue_id: venue.id)
    person = Person.create!(selected_venue_id: venue.id,
                            venue_id: venue.id)
    person.closest_venues << cv
    person.closest_venues.length.should eq 1

    process_message_from_person("RESTART", person)

    person.closest_venues.length.should eq 0
    person.selected_venue_id.should eq nil
    person.venue.should eq nil
  end

end
