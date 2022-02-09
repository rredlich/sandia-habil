Rails.application.routes.draw do
  get '/', to: 'home#index'
  post '/result', to: 'home#result', as: 'result'
end
