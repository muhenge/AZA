Rails.application.routes.draw do
  devise_for :customers,
  path: '',
  path_names: {
    sign_in: 'api/login',
    sign_out: 'api/logout',
    registration: 'api/signup'
  },
  controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    edit: 'customers/registrations#update'
  }

  post '/api/transactions', to: 'api/transactions#create'
  get '/api/transactions', to: 'api/transactions#index'
  get '/api/transactions/:id', to: 'api/transactions#show'
end
