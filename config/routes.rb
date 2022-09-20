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

  namespace :api do
    resources :transactions, only: [:index, :create, :show]
  end

end
