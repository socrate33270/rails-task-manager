Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  get "tasks", to: "tasks#index"
  # rediriger vers une page qui affiche le formulaire permettant de créer une nouvelle tache
  get "tasks/new", to: "tasks#new"
  get "tasks/:id", to: "tasks#show", as: "task"
  # root "posts#index"
  post "tasks", to: "tasks#create"
  # routes pour modifier une tache
  get "tasks/:id/edit", to: "tasks#edit", as: "edit"
  # mise a jour de la tache après envoi du formulaire
  patch "tasks/:id", to: "tasks#update"
  delete "tasks/:id", to: "tasks#destroy"
end
