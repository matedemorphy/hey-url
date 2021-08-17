# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'urls#index'

  resources :urls, only: %i[index create show], param: :short_url
  get ':short_url', to: 'urls#visit', as: :visit

  namespace :api, defaults: { format: :json }, path: '/' do
    namespace :v1 do
      resources :urls
    end
  end
end
