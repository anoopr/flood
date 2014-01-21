require 'message_processor'

class TwilioController < ApplicationController
  include MessageProcessor
  
  protect_from_forgery :except => ["receive"]

  def receive
    person = Person.find_or_create_by_phone_number(params[:From])
    messages = process_message_from_person(params[:Body], person)

    response = Twilio::TwiML::Response.new do |r|
      messages.each { |m| r.Sms m }
    end

    respond_to do |format|
      format.xml { render xml: response.text }
    end
  end

end
