Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users,
             controllers: {
                 sessions: 'user/sessions',
                 registrations: 'user/registrations'
             }
  get '/test', to: 'test#show'
  namespace :api do
    namespace :v1 do
      resources :members do
        resources :facts
      end
    end
  end
end
