require 'open-uri'

module TwoFishes

  def center_for_zip_code(zip_code)
    center = nil
    open("http://demo.twofishes.net/?query=#{zip_code}") do |f|
      parsed = ActiveSupport::JSON.decode(f)
      center = parsed['interpretations'][0]['feature']['geometry']['center']
    end
    center
  end

end
