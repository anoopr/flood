require 'spec_helper'
require 'two_fishes'

describe TwoFishes do
  include TwoFishes

  it 'gets a center for 10003' do
    center = center_for_zip_code('10003')
    center.should_not be_nil
    center['lat'].should_not be_nil
    center['lng'].should_not be_nil
  end
  
end

