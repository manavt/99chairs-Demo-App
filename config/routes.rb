Rails.application.routes.draw do
  resources :csv_processsors, only: [:create, :new, :index]
  root to: "csv_processsors#new"
end
