Part::Application.routes.draw do
devise_for :users
#~ resources :home
match '/home'=>'home#index',:as=>'home_index'
match '/home/create_user' => 'home#create_user'
match '/home/task' => 'home#task'
match '/home/new' => 'home#new',:as=>'new_home'
match '/home/:id/edit'=>'home#edit',:as=>'edit_home'
match '/home/:id/update'=>'home#update'
match '/home/:id/show'=>'home#show',:as=>'home_show'
match '/home'=>'home#create'
match '/schedules/report'=>'schedules#report',:as=>'schedules_report'
match '/schedules/mypage'=>'schedules#mypage',:as=>'schedules_mypage'
match '/home/:id/edit1' => 'home#edit1',:as=>'edit1_home'
match '/home/:id/update1'=>'home#update1'
resources :schedules
resources :to_dos do
collection do
get :filter
end
end
resources :assignments
resources :goals
resources :events
resources :lists
root :to => 'home#index'
#root:to=>'assignments#index'
#root:to=>'goals#index'
#root:to=>'to_dos#index'
#root:to=>'events#index'
#root :to=>'schedules#index'
  #get '/to_dos'

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
  #root :to => 'to_dos#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
 #match ':controller(/:action(/:id(.:format)))'
end
