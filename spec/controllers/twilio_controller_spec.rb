require 'spec_helper'

describe TwilioController do

  describe 'POST #receive' do

    it 'restarts' do
      post :receive, From: '+15551212', Body: 'RESTART', format: :xml
      response.status.should eql 200
    end

  end

end
