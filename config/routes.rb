require 'sidekiq/web'

Rails.application.routes.draw do
	get		'results/create'
	root	'static_pages#home'
	get		'/help',	to:	'static_pages#help'
	get		'/about',	to:	'static_pages#about'
	get		'/contact',	to:	'static_pages#contact'
	get		'/signup',	to:	'users#new'
	post	'/signup',	to:	'users#create'
	get		'/login',	to:	'sessions#new'
	post	'/login',	to:	'sessions#create'
	delete	'/logout',	to:	'sessions#destroy'
	post	'/result',	to:	'results#create'
	post	'/judged',	to:	'submissions#update'
	get		'submissions/renew',	to:	'submissions#renew'
	get		'submissions/srenew',	to:	'submissions#srenew'
	get		'submissions/getall',	to:	'submissions#getall'
	get		'problems/getnames',	to:	'problems#getnames'
	get		'users/getnames',		to:	'users#getnames'
	mathjax 'mathjax'
	resources :users
	resources :problems
	resources :submissions
	mount Sidekiq::Web => '/sidekiq'
end
