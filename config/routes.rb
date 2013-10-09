Boilerplate::Application.routes.draw do
  resources :users, :only => [:create, :new, :show] do
    collection do
      match 'search', :via => [:get]
    end
  end
  resource :session, :only => [:create, :destroy, :new]
  resource :root
  
  root :to => "roots#show"
end