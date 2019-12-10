Rails.application.routes.draw do
  devise_for :companies, controllers: {
  sessions:      'companies/sessions',
  passwords:     'companies/passwords',
  registrations: 'companies/registrations'
  
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  root "pages#home", as:"root"
  get "/companies", to:"companies#home", as:"companies_home"
  #募集ページの編集
    get "/companies/offer", to:"companies#offer", as:"companies_offer"
    post "/companies/create", to:"companies#create"
    delete "/companies/offer/:id", to:"companies#destroy"
    get "/companies/offer/:id/edit", to:"companies#edit"
    patch "/companies/offer/:id", to:"companies#update"
  #募集ページの編集
    get "/companies/show", to:"companies#show",　as:"companies_show"
    get "/companies/show/:id", to:"companies#detail"
    get "/users", to:"users#home", as:"users_home"
    get "/users/search", to:"users#search", as:"users_search"
end
