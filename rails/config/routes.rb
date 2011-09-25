WhowishWordRails::Application.routes.draw do
  root :to => "home#index"
  match ':controller(/:action(/:id(.:format)))'
end
