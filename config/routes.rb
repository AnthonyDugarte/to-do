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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
