Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :missions, only: %i[index create], controller: "houston/missions"

  resources :spacecrafts, only: [], controller: "houston/spacecrafts" do
    resources :missions, only: :index, controller: "houston/spacecraft/missions"
  end
end
