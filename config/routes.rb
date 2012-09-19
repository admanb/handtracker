Handtracker::Application.routes.draw do
  resources :users do
    collection do
      post :authenticate
    end
    member do
      get :logout
    end
  end
    
  resources :templates do
    member do
      get :toggle_public
    end
    resources :cards do
      member do
        get :copy
      end
    end
  end
  resources :games do
    member do 
      post :remove_player, :change_player
    end
    resources :decks do
      member do
        get :draw, :shuffle
      end
    end
    resources :acts
  end
  
  resources :card_states do # this is weird because we don't use any of them
    member do
      get :play, :give
      post :give_card
    end
  end

  match '/login', :to => 'users#login', :as => 'login'
  root :to => 'users#login'

end
