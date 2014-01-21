require 'foursquare'
require 'two_fishes'

module MessageProcessor
  include Foursquare
  include TwoFishes

  def process_message_from_person(message, person)
    response_messages = []
    if (message.upcase == "RESTART")
      person.restart
      response_messages << "Text your Zip Code to get started"
    elsif (message =~ /^\d{5}([\-]\d{4})?$/) # match Zip Codes
      person.restart

      center = center_for_zip_code(message)
      if (center)
        listItems = fsq_client.list(ENV['FOURSQUARE_LIST_ID'],
                                    ll: "#{center['lat']},#{center['lng']}",
                                    sort: "nearby")[:listItems][:items]
      else
        listItems = fsq_client.list(ENV['FOURSQUARE_LIST_ID'])[:listItems][:items]
      end
     
      listItems.length.times do |i|
        v = Venue.find_or_create_by_foursquare_id(listItems[i][:venue][:id])
        v.name = listItems[i][:venue][:name]
        v.address = listItems[i][:venue][:location][:address]
        v.save
        person.closest_venues << ClosestVenue.create(position: i, venue_id: v.id)
      end
    
      person.closest_venues.each do |cv|
        response_messages << "#{cv.position + 1}. #{cv.venue.name}\n#{cv.venue.address}"
      end
      response_messages << "Text '1', '2', or '3' to select a volunteer site."
  
    elsif (person.closest_venues.count > 0 && params[:Body] =~ /^[123]$/) # Match 1, 2, or 3
      cv = person.closest_venues[params[:Body].to_i - 1]
      person.selected_venue_id = cv.venue.id
      person.save
      response_messages << "Text 'HERE' when you arrive at #{cv.venue.name}.\nText 'RESTART' to start over."

    elsif (params[:Body].upcase == "HERE")
      person.venue = Venue.find(person.selected_venue_id)
      person.save
      response_messages << "We've got you at #{person.venue.name}.\nSomeone will contact you with instructions shortly. Thanks!"
      
    else
      response_messages << "Sorry, I don't understand. Text 'RESTART' to start over."
    end

    response_messages
  end

end
