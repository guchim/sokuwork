Rails.application.routes.draw do
  devise_for :companies, controllers: {
  sessions:      'companies/sessions',
  passwords:     'companies/passwords',
  registrations: 'companies/registrations'
  
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
}
#トップページ
  root "pages#home", as:"root"
  get "/search", to:"pages#search", as:"pages_search"
  get "/detail/:id", to:"pages#detail"
  post "pages/create/:id", to:"pages#create"
#ユーザーページ
  get "/users/profile", to:"users#profile",as:"profile"
  get "/users/confirmation", to:"users#confirmation"
#ユーザーのプロフィールページの編集
  patch "/users/profile/edit", to:"users#update"
#企業ページ
  get "companies/confirmation", to:"companies#confirmation"
  get "/companies/review", to:"companies#review"
  get "/companies/show", to:"companies#show"
#募集ページ
  get "/companies/offer", to:"companies#offer"
  post "/companies/create", to:"companies#create"
  delete "/companies/offer/:id", to:"companies#destroy"
  get "/companies/offer/:id/edit", to:"companies#edit"
  patch "/companies/offer/:id", to:"companies#update"
end
