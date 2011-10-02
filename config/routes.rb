Ikeepmysql::Application.routes.draw do

  root :to => "session#new"

  #website
  match "website" => "website#index", :as => "windex"
  match "website/new" => "website#new", :as => "wnew"
  post "website/create" => "website#create", :as => "wcreate"
  get "website/edit/:id" => "website#edit", :as => "wedit"
  post "website/update" => "website#update", :as => "wupdate"
  get "website/delete/:wid" => "website#destroy", :as => "wdestroy"
  post "website/ajax_create" => "website#ajax_create", :as => "wajaxcreate"
  post "website/ajax_get_title" => "website#ajax_get_title", :as => "wajaxgettitle"
    #match "website/:id" => "website#show", :as => "wshow"


  #user
    #match "user" => "user#index", :as => "uindex"
  match "register" => "user#new", :as => "unew"
  post "user/create" => "user#create"
  get "user/edit/:id" => "user#edit", :as => "uedit"
  post "user/update/:id" => "user#update", :as => "uupdate"
  match "user/:id" => "user#show", :as => "ushow"

  #category
  post "category/delete/:id" => "category#destroy", :as => "cdestroy"
  post "category/create" => "category#create", :as => "ccreate"
  get "categoey/edit" => "category#edit", :as => "cedit"
  match "user/:name/category/:id" => "category#show", :as => "cshow"
  post "category/ajax_update" => "category#ajax_update", :as => "cajaxupdate"

  #session
  post "session/create", :as => "screate"
  match "logout" => "session#destroy", :as => "sdestroy"


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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
