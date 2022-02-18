Rails.application.routes.draw do
  get '/', to: 'home#index'
  get '/result/(:startDate/:workingDays)', to: 'home#result', as: 'result'
  post '/result/', to: 'home#result', as: 'result_post'
end
