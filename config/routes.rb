Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#render_cover"
  get "/home", to: "home#render_home"
  get "/login", to: "home#render_login"
  get "/signup", to: "home#render_signup"
  get "/cover", to: "home#render_cover"
  post '/create_new_income', to: 'main#create_income'

  match '/create_new_user', :to => 'users#register', :via => :post
  match '/to_login_handler', :to => 'session#login_handler', :via => :post

  get "/income", to: "home#render_income"
  get "/expense", to: "home#render_expense"
end
