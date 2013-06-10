Flood::Application.routes.draw do
  # root :to => 'welcome#index'
  match 'twilio/receive', via: :post
end
