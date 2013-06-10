module Foursquare
  
  def fsq_client
    Foursquare2::Client.new(client_id: ENV['FOURSQUARE_CLIENT_ID'],
                            client_secret: ENV['FOURSQUARE_CLIENT_SECRET'])
  end

end
