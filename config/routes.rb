# config/routes.rb
Rails.application.routes.draw do
	# Routes for subscription management
	resources :subscriptions, only: [:new, :create] do
		collection do
			get 'renew'
			patch 'update'
		end
	end
	
	# Devise routes with custom sessions controller for admins
	devise_for :admins, controllers: {
		sessions: 'admin/sessions'
	}
	
	devise_for :users
  
	namespace :admin do 
		resources :users
	end
	
	resources :buyers
	resources :sellers
	resources :companies
	
	resources :assignments 
	resources :leads 
	resources :tracks
	
	resources :amenities
	resources :properties

	resources :tenants
	resources :sales
	resources :articles

	resources :media

	root 'portal_page#landing_page'
	get 'dashboard', to: 'portal_page#dashboard' 
end
