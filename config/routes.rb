Rails.application.routes.draw do
  devise_for :users
  
  root to:"monitorings#index"
  resources :monitorings do
    collection do
      get 'lists'
    end
  end

  resources :temptations, except: [:index] do
    collection do
      get 'lists'
    end
  end

  resources :monitoring_steps do
    collection do
      get 'step1'
      get 'step2'
    end
  end
end
