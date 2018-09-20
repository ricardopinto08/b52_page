require 'sidekiq/api'
require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    }, defaults: { format: :json }
    match "queue-latency" => proc { [200, {"Content-Type" => "text/plain"}, [Sidekiq::Queue.new.latency < 30 ? "OK" : "UHOH" ]] }, via: :get
    mount Sidekiq::Web => '/sidekiq'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
