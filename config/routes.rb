Rails.application.routes.draw do
  get 'messages/create'
  devise_for :users
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :chat_rooms
  resources :messages

  root to: "chat_rooms#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
