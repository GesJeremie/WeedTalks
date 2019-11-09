Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  # Redirect www to no-www
  if Rails.env.production?
    constraints subdomain: 'www' do
      get ':any', to: redirect(subdomain: nil, path: '/%{any}'), any: /.*/
    end
  end

  root 'pages#home'

  resources :questions, only: [:index, :new, :create]
  resource :game
  resource :newsletter, only: [:show, :create]
end

