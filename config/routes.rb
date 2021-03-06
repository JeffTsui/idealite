Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :milestones

  resources :homes do
  end
  
  resources :post_actors

  get 'post_as/index'

  resources :posts

  resources :idea_teams

  resources :user_team_roles do
    put :apply, on: :member
  end

  resources :profiles

  get 'activities/index'

  resources :idea_briefs
  
  resources :users

  resources :ideas do
    post :update_teams, :on => :member
    get :post_actor_id, :on => :collection, :format => :json
    get :like, :on => :member
    get :detail, :on => :member
    get :avatar, :on => :member
    get :aws_update_avatar, :on => :member
    get :team, :on => :member
    post :claim_idea, on: :collection
    post :new_survey, on: :member
    put :finish_survey, on: :member
    put :delete_survey, on: :member
    post :attempt, on: :member
    put :privacy, on: :member
    put :link, on: :member
  end

  resources :theme_ideas

  resources :themes do
    get :like, :on => :member
    post :claim_theme, on: :collection
    put :apply_idea, on: :member
  end

  resources :idea_links

  resources :teams do
    get :autocomplete_user_name, :on => :collection
  end
  
  resources :team_requests
  
  resources :activities
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
