Local27retirees::Application.routes.draw do

  get   "login"  => "sessions#new"
  post  "login"  => "sessions#create"
  match "logout" => "sessions#destroy"

  resources :users

  resources :events, :only => %w(index)

  get  "contact" => "contact_requests#new", :as => "new_contact_request"
  post "contact" => "contact_requests#create", :as => "contact_requests"

  resources :news, :only => %w(show), :controller => :news_posts, :as => :news_posts

  controller :pages do
    get "home"
    get "contacts"
    get "calendar"
    get "who-we-are" => "pages#who_we_are"
  end

  resources :gallery, :controller => "photo_sets", :as => "photo_sets", :only => %w(index show) do
    resources :photos, :only => %w(show)
  end

  #resources :forums do
  #  resources :posts do
  #    resources :replies
  #  end
  #end

  #
  # Administrative routes
  #

  namespace :admin do
    resources :articles
    resources :news_posts
    resources :forums
    resources :photo_sets do
      put "sort", :on => :collection
      resources :photos do
        put "sort", :on => :collection
      end
    end
  end


  post "/pages/postback"

  root :to => "pages#home"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
