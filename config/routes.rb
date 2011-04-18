Qv::Application.routes.draw do
  get "user_access/menu"

  get "user_access/login"

  resources :videos
  
  match 'admin', :to => 'user_access#menu'

 
  match ':controller(/:action(/:id(.:format)))'
end
