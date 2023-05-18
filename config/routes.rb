Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "bicycles#index"

  resources :bicycles
  post(
    %(/webhooks/telegram/#{AppConfig.telegram["TELEGRAM_BOT_TOKEN"]}),
    to: "telegram_events#create"
  )
end
