Flood::Application.routes.draw do
  match 'twilio/receive', via: :post
end
