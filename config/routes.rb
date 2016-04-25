Rails.application.routes.draw do
 

  resources :titles

  resources :schedules

  root 'pages#home'
  
  resources :coaches

  resources :players
  resources :sections
  resources :titles
  resources :sports
  

  resources :pins do
  member do
    put "like", to: "pins#upvote"
    put "dislike", to: "pins#downvote"
	end
	end
  resources :comments
  resources :posts do
	resources :comments
  end
  get '/FootballSkills', :to => 'pages#FootballSkills'
  get '/HurlingSkills', :to => 'pages#HurlingSkills'
   get '/GainingPosession', :to => 'pages#GainingPosession'
     get '/Tackling', :to => 'pages#Tackling'
	   get '/Scoring1', :to => 'pages#Scoring1'
	   get '/ScoringH', :to => 'pages#ScoringH'
	   get '/GainingPosessionH', :to => 'pages#GainingPosessionH'
	   get '/TacklingH', :to => 'pages#TacklingH'
  get 'oneplayerdiary', :to => 'players#oneplayer'
  
  get 'onesection', :to => 'players#onesection'
  get 'playerdiary', :to => 'coaches#playerdiary'

  get 'coachesschedule', :to => 'players#coachesschedule'
  
get 'bmichart', :to => 'bmichart#show'
get 'players/:id' => 'players#show'
#get 'search' => 'post#search'
  controller :sessions do
	get '/playersignin', :to => 'sessions#playernew'
	post '/playersignin', :to => 'sessions#playercreate'
	get '/playersignout', :to => 'sessions#playerdestroy'
	get '/playersearch', :to => 'players#playersearch'
  
	get '/coachsignin', :to => 'sessions#coachnew'
	post '/coachsignin', :to => 'sessions#coachcreate'
	get '/coachsignout', :to => 'sessions#coachdestroy'
	get '/coachsearch', :to => 'coaches#coachsearch'
  end
  
  resources :sessions

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
