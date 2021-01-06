Rails.application.routes.draw do
    get '/users', to: 'users#index'
    get '/users/:id', to: 'users#show'
    post '/users', to: 'users#create'
    put '/users', to: 'users#update'
    delete '/users', to: 'users#destroy'
    post '/add_credits', to: 'credits#add_credits'
    post '/substract_credits', to: 'credits#substract_credits'
    get '/view_credits_user', to: 'credits#view_credits_user'
    get '/view_credits_store', to: 'credits#view_credits_store'
    get '/massive_charge', to: 'massive_charge#form'
    post '/massive_charge/send', to: 'massive_charge#send_form'
end
