Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/test1', to: 'keyta#numberone'
  post '/test2', to: 'keyta#numbertwo'
  post '/test3', to: 'keyta#numberthree'
end
