Rails.application.routes.draw do
  resources :tasks

  resources :lines do
    resources :tasks
  end

  resources :projects do
    resources :tasks

    resources :lines do
      resources :tasks
    end
  end

  root 'projects#index'
end
