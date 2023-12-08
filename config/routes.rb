Rails.application.routes.draw do
  devise_for :members, :controllers => { registrations: "registrations"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts

  # Defines the root path route ("/")
  root to: "posts#index"
  get '*path' => redirect('/')
end

