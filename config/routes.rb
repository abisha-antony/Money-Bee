Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#render_cover"
  get "/home", to: "home#render_home"
  get "/login", to: "home#render_login"
  get "/signup", to: "home#render_signup"
  get "/cover", to: "home#render_cover"
  
  get "/income", to: "home#render_income"
  get "/expense", to: "home#render_expense"
  post '/create_new_user', to: 'users#register'
  match '/to_login_handler', :to => 'session#login_handler', :via => :post
  post '/create_expense', to: 'main#create_expense'
  post '/create_income', to: 'main#create_income'
  match '/delete/:id' ,to:"main#delete_income", :via=>:get
  
  get "/exp_dlt/:ed", to: "main#delete_expense", as: :ed
  get "/inc_dlt/:id", to: "main#delete_income", as: :id
  
  get "/edit_income/:ei", to: "home#render_inc_edit", as: :ei
  get "/edit_expense/:ee", to: "home#render_exp_edit", as: :ee
  post "/update_income", to: "main#update_income"
  post "/update_expense", to: "main#update_expense"
  get "/debt_recorder", to: "home#render_debt"

  match '/create_debt_records', :to=> 'main#debt_recorder', :via => :post
  match '/dlt_debt/:id', :to=> "main#delete_debt", :via=> :get
  get "/edit_debt_records/:ej", :to=> "home#render_debt_edit", as: :ej
  post "/update_debt", :to=> "main#dbt_edit"

end
